const { join } = require('path')
require('dotenv').config({ path: join(__dirname, '.env') })
const { knexSnakeCaseMappers } = require('objection')

module.exports = {
  client: 'pg',
  connection: {
    host: process.env.HOST,
    user: process.env.USER,
    password: process.env.PASSWORD,
    database: process.env.DB,
    port: parseInt(process.env.PORT, 10) || 5432,
    ssl: process.env.SSL === 'TRUE',
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
