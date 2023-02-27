/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    ALTER TABLE trap_visit ADD CONSTRAINT unique_trap_visit UNIQUE (program_id, trap_location_id, trap_visit_time_start);
    `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    ALTER TABLE trap_visit DROP CONSTRAINT unique_trap_visit;
    `)
}
