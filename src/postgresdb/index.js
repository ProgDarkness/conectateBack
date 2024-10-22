import promise from 'bluebird'
import pgPromise from 'pg-promise'
import conexion1Config from '../../postgres-bd-1.json'

// import {Diagnostics} from './diagnostics'

const initOptions = {
  promiseLib: promise
}

const pgp = pgPromise(initOptions)
export const db1 = pgp(conexion1Config)

// export const db2 = pgp(conexion2Config)
// Diagnostics.init(initOptions);
