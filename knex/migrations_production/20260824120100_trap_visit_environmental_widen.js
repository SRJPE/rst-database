/**
 * Widen trap_visit_environmental to fit user-defined form fields.
 *
 * measure_name stores a form field's field_name, but was VARCHAR(50) while
 * form_field.field_name is VARCHAR(100). An over-long name fails the INSERT and
 * 400s the *entire* trap visit POST, taking the crew's fish counts with it.
 *
 * measure_value_text is widened to 255 to leave headroom for a comma-joined
 * multi-select value (a single option definition is VARCHAR(100)).
 *
 * Widening a varchar(n) is a catalog-only change in PostgreSQL — no table
 * rewrite. The down migration truncates with left() so rollback cannot error on
 * rows written while the column was wide.
 *
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    ALTER TABLE trap_visit_environmental
      ALTER COLUMN measure_name TYPE VARCHAR(100),
      ALTER COLUMN measure_value_text TYPE VARCHAR(255);
  `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    ALTER TABLE trap_visit_environmental
      ALTER COLUMN measure_name TYPE VARCHAR(50) USING left(measure_name, 50),
      ALTER COLUMN measure_value_text TYPE VARCHAR(100) USING left(measure_value_text, 100);
  `)
}
