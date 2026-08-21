/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    CREATE UNIQUE INDEX program_fields_unique_idx
    ON program_fields (
      program_id,
      form_field_id,
      COALESCE(equipment_id, -1)
    )
  `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    DROP INDEX IF EXISTS program_fields_unique_idx
  `)
}
