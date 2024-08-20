/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    ALTER TABLE catch_raw ALTER COLUMN qc_time SET DEFAULT timezone('UTC'::text, timezone('America/Los_Angeles'::text, now()));
    `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    ALTER TABLE catch_raw ALTER COLUMN qc_time SET DEFAULT NOW();
    `)
}
