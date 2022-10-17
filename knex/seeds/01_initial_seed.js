/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */

const fs = require('fs')
const path = require('path')

exports.seed = async function (knex) {
  return knex.raw(
    fs.readFileSync(
      path.join(__dirname, '../../seed_data/seed_data.sql'),
      'utf8'
    )
  )
}
