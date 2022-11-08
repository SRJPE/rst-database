const { join } = require('path')
require('dotenv').config({ path: join(__dirname, '.env') })
const { knexSnakeCaseMappers } = require('objection')

module.exports = {
  client: 'pg',
  connection: {
    host: process.env.POSTGRES_HOST,
    user: process.env.POSTGRES_USER,
    password: process.env.POSTGRES_PASSWORD,
    database: process.env.POSTGRES_DB,
    port: parseInt(process.env.POSTGRES_PORT, 10) || 5432,
    ssl: process.env.POSTGRES_SSL === 'TRUE',
  },
  pool: {
    min: 2,
    max: 10,
  },
  migrations: {
    directory: join(__dirname, '/knex/migrations'),
  },
  seeds: {
    directory: join(__dirname, '/knex/seeds'),
  },
  ...knexSnakeCaseMappers(),
}
