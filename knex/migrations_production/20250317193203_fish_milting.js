/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    ALTER TABLE catch_raw ADD COLUMN milting BOOLEAN NULL;
    ALTER TABLE trap_visit ADD COLUMN sampling_altered BOOLEAN NULL;
    `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    ALTER TABLE catch_raw DROP COLUMN milting;
    ALTER TABLE trap_visit DROP COLUMN sampling_altered;
    `)
}
