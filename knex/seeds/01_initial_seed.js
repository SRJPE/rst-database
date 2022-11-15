/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */

const fs = require('fs')
const path = require('path')

exports.seed = async function (knex) {
  if (process.NODE_ENV === 'development') {
    return knex.raw(
      fs.readFileSync(
        path.join(__dirname, '../../seed_data/seed_data.sql'),
        'utf8'
      )
    )
  } else if (
    process.NODE_ENV === 'staging' ||
    process.NODE_ENV === 'production'
  ) {
    return knex.raw(
      fs.readFileSync(
        path.join(__dirname, '../../seed_data/seed_azure.sql'),
        'utf8'
      )
    )
  }
}
