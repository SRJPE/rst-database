/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    ALTER TABLE program ALTER COLUMN program_name TYPE VARCHAR(100);
    ALTER TABLE program ALTER COLUMN stream_name TYPE VARCHAR(100);
  `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    ALTER TABLE program ALTER COLUMN program_name TYPE VARCHAR(25);
    ALTER TABLE program ALTER COLUMN stream_name TYPE VARCHAR(25);
  `)
}
