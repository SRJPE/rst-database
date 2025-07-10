/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    CREATE TYPE input_type_enum AS ENUM ('text', 'integer', 'float');
    ALTER TABLE form_field ADD COLUMN input_type input_type_enum NULL;
    `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    ALTER TABLE form_field DROP COLUMN input_type;
    DROP TYPE IF EXISTS input_type_enum CASCADE;
    `)
}
