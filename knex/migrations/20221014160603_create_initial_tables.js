/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */

const fs = require('fs')
const path = require('path')

exports.up = function (knex) {
  return knex.raw(
    fs.readFileSync(
      path.join(__dirname, '../../tables/create_tables.sql'),
      'utf8'
    )
  )
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(
    fs.readFileSync(
      path.join(__dirname, '../../tables/drop_tables.sql'),
      'utf8'
    )
  )
}
