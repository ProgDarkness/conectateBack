import { db1 } from '../../postgresdb'

export default {
  Mutation: {
    obtenerFotoPerfilUsuario: async (_, { idUser }) => {
      try {
        const fotoperfilusuario = await db1.oneOrNone(
          `SELECT id_fotoperfil as id, tx_archivo as archivo
          FROM public.d012t_fotoperfil WHERE id_usuario = $1;`,
          [idUser]
        )

        return {
          status: 200,
          message: 'Foto perfil usuario encontrado',
          type: 'success',
          response: fotoperfilusuario
        }
      } catch (e) {
        return { status: 500, message: `Error: ${e.message}`, type: 'error' }
      }
    },
    crearFotoEstudiante: async (_, { input }) => {
      const { archivo, idUsuario } = input
      try {
        const fotoperfil = await db1.oneOrNone(
          `SELECT id_fotoperfil FROM public.d012t_fotoperfil WHERE id_usuario = $1;`,
          [idUsuario]
        )

        if (!fotoperfil?.id_fotoperfil) {
          await db1.none(
            `INSERT INTO public.d012t_fotoperfil(tx_archivo, id_usuario, created_at) VALUES ($1, $2, now());`,
            [archivo, idUsuario]
          )
        } else {
          await db1.none(
            `UPDATE public.d012t_fotoperfil
                      SET tx_archivo = $1, updated_at = now()
                      WHERE id_usuario = $2;`,
            [archivo, idUsuario]
          )
        }

        return {
          status: 200,
          type: 'success',
          message: 'Fotografia registrada exitosamente'
        }
      } catch (e) {
        return { status: 500, message: `Error: ${e.message}`, type: 'error' }
      }
    },
    eliminarFotoEstudiante: async (_, { input }) => {
      const { idFotoEstudiante } = input
      try {
        await db1.none(
          `DELETE FROM public.d012t_fotoperfil WHERE id_fotoperfil = $1;`,
          [idFotoEstudiante]
        )

        return {
          status: 200,
          message: 'Fotografia eliminada exitosamente',
          type: 'success'
        }
      } catch (e) {
        return { status: 500, message: `Error: ${e.message}`, type: 'error' }
      }
    }
  }
}