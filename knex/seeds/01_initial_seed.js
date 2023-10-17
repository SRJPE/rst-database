/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */

const fs = require('fs')
const path = require('path')
const { join } = require('path')
require('dotenv').config({ path: join(__dirname, '.env') })

exports.seed = async function (knex) {
  if (process.env.NODE_ENV === 'development') {
    return knex.raw(
      fs.readFileSync(
        path.join(__dirname, '../../seed_data/seed_data.sql'),
        'utf8'
      )
    )
  } else if (
    process.env.NODE_ENV === 'staging' ||
    process.env.NODE_ENV === 'production'
  ) {
    // must do manually b/c of Azure permissions
    // see init-db.sh script for look up seeds
    // run remaining knex seeds
  }
}
