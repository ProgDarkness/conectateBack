import { db1 } from '../../postgresdb'
import CryptoJS from 'crypto-js'
import jwt from 'jsonwebtoken'
import dotenv from 'dotenv'
import { ApolloError } from 'apollo-server-core'

dotenv.config()

export default {
  Query: {
    prueba: async (_, __) => {
      const usuarios = await db1.manyOrNone(
        `SELECT co_usuario, usuario, nu_clave, tx_correo, co_rol
        FROM public.d008t_usuarios;`
      )

      for (const usuario of usuarios) {
        const roles = await db1.oneOrNone(
          `SELECT co_rol, nb_rol FROM public.i005t_roles WHERE co_rol = $1`,
          [usuario.co_rol]
        )

        usuario.rol = roles
      }

      return {
        status: 200,
        message: 'Hola Mundo',
        type: 'success'
      }
    },
    login: async (_, { input }) => {
      const { SECRET_KEY } = process.env
      const { usuario: numCedula, clave } = input
      try {
        const claveDesencriptada = CryptoJS.AES.decrypt(
          clave,
          SECRET_KEY
        ).toString(CryptoJS.enc.Utf8)
        const hashClave = CryptoJS.SHA256(claveDesencriptada).toString()

        const login = await db1.oneOrNone(
          `SELECT co_usuario, usuario, nu_clave, tx_correo, co_rol, created_at
          FROM public.d008t_usuarios WHERE usuario = $1 AND nu_clave = $2;`,
          [numCedula, hashClave]
        )

        if (login) {
          const { co_usuario, usuario, nu_clave, tx_correo, co_rol } = login

          const rutaPrincipal = await db1.manyOrNone(
            `SELECT id_permiso, co_rol, id_ruta, tx_permisos
            FROM public.d013t_permisos WHERE co_rol = $1 ORDER BY id_permiso ASC`,
            [co_rol]
          )

          const ConsultaNameRuta = await db1.oneOrNone(
            `SELECT nb_ruta
            FROM public.i009t_rutas WHERE id_ruta = $1`,
            [rutaPrincipal[0].id_ruta]
          )

          const nameRuta = ConsultaNameRuta.nb_ruta

          login.token = jwt.sign(
            {
              co_usuario,
              usuario,
              nu_clave,
              tx_correo,
              co_rol
            },
            SECRET_KEY,
            { expiresIn: 60 * 40 }
          )

          login.nameRuta = nameRuta

          return CryptoJS.AES.encrypt(
            JSON.stringify({
              status: 200,
              message: 'Acceso permitido. Cargando Datos...',
              type: 'success',
              response: login
            }),
            SECRET_KEY
          ).toString()
        } else {
          return CryptoJS.AES.encrypt(
            JSON.stringify({
              status: 202,
              message: 'Usuario y/o Contraseña Incorrectos.',
              type: 'error'
            }),
            SECRET_KEY
          ).toString()
        }
      } catch (e) {
        return CryptoJS.AES.encrypt(
          JSON.stringify({ status: 500, message: e.message, type: 'error' }),
          SECRET_KEY
        ).toString()
      }
    },
    user: async (_, __, { auth }) => {
      if (!auth) throw new ApolloError('Sesión no válida')

      const { SECRET_KEY } = process.env
      const { co_usuario, usuario, nu_clave, tx_correo, co_rol } = auth

      auth.token = jwt.sign(
        {
          co_usuario,
          usuario,
          nu_clave,
          tx_correo,
          co_rol
        },
        SECRET_KEY,
        { expiresIn: 60 * 100000 }
      )
      return CryptoJS.AES.encrypt(JSON.stringify(auth), SECRET_KEY).toString()
    },
    getMenu: async (_, { idRol }, { auth }) => {
      if (!auth) throw new ApolloError('Sesión no válida')

      try {
        const menu = await db1.oneOrNone(
          `SELECT tx_menu
          FROM public.i010t_menus WHERE co_rol = $1`,
          [idRol]
        )

        return menu.tx_menu
      } catch (e) {
        throw new ApolloError(e.message)
      }
    },
    getRolAcceso: async (_, { ruta, idRol }, { auth }) => {
      if (!auth) throw new ApolloError('Sesión no válida')

      try {
        const idRuta = await db1.oneOrNone(
          `SELECT id_ruta
            FROM public.i009t_rutas WHERE nb_ruta = $1`,
          [ruta]
        )

        if (idRuta.id_ruta) {
          const permisosRol = await db1.oneOrNone(
            `SELECT id_permiso, tx_permisos
                                    FROM public.d013t_permisos WHERE co_rol = $1 AND id_ruta = $2`,
            [idRol, idRuta.id_ruta]
          )

          if (permisosRol) {
            return {
              status: 200,
              message: 'Acceso permitido',
              type: 'success',
              response: permisosRol
            }
          } else {
            return {
              status: 404,
              message: 'Acceso denegado',
              type: 'Error'
            }
          }
        }
      } catch (e) {
        throw new ApolloError(e.message)
      }
    }
  },
  Mutation: {
    inserNewUser: async (_, { usuario, pri_nombre, seg_nombre, pri_apellido, seg_apellido, cedula_usr, gerencia, correo, clave }) => {
      try {
        const { SECRET_KEY } = process.env
        const claveDesencriptada = CryptoJS.AES.decrypt(
          clave,
          SECRET_KEY
        ).toString(CryptoJS.enc.Utf8)
        const hashClave = CryptoJS.SHA256(claveDesencriptada).toString()

        if (hashClave !== null) {
          await db1.none(
            `INSERT INTO public.d008t_usuarios
            (usuario, nu_clave, nb_usuario, nb2_usuario, ap_usuario, ap2_usuario, cedula_usr, gerencia, tx_correo, co_rol)
            VALUES($1, $9, $2, $3, $4, $5, $6, $7, $8, 1);`,
            [usuario,
              correo,
              hashClave, 
              pri_nombre, 
              seg_nombre, 
              pri_apellido, 
              seg_apellido, 
              cedula_usr,
              gerencia
            ]
          )

          return {
            status: 200,
            message: 'El usuario se ha registrado correctamente',
            type: 'success'
          }
        }

        return {
          status: 404,
          message: 'Error al registrar usuario',
          type: 'error'
        }
      } catch (e) {
        throw new ApolloError(e.message)
      }
    }
  }
}
