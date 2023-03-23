/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  // return knex.raw(`
  //   ALTER TABLE trap_visit ADD CONSTRAINT unique_trap_visit UNIQUE (program_id, trap_location_id, trap_visit_time_start) NOVALIDATE;
  //   `)

  return knex.raw(`
    CREATE UNIQUE INDEX unique_trap_visit
    ON trap_visit (program_id, trap_location_id, trap_visit_time_start)
    WHERE created_at >= '2023-02-28'::timestamp;
    `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  // return knex.raw(`
  //   ALTER TABLE trap_visit DROP CONSTRAINT unique_trap_visit;
  //   `)

  return knex.raw(`
    DROP INDEX IF EXISTS unique_trap_visit;
    `)
}
