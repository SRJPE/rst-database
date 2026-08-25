/**
 * Per-form-field select option sets.
 *
 * Until now every dropdown needed its own bespoke table (gear_status, tide_code,
 * debris_level, ...) plus a model, a hardcoded entry in the server's dropdowns
 * list, and a hardcoded key in the tablet's redux store. A field created from the
 * dashboard can do none of that, so its dropdown rendered empty. This table is the
 * generic replacement: options live here, keyed to the form field that owns them.
 *
 * The { id, definition } shape deliberately mirrors the lu* lookup tables so
 * rst-pilot-app-client's FastSelect renders these with no special-casing.
 *
 * Note trap_visit_environmental stores the option *text*, not an id, so hard
 * deleting an option can never orphan a recorded measurement.
 *
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    CREATE TABLE IF NOT EXISTS form_field_option (
      id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      form_field_id INTEGER NOT NULL REFERENCES form_field ON DELETE CASCADE,
      definition VARCHAR(100) NOT NULL,
      order_index INTEGER,
      active BOOLEAN NOT NULL DEFAULT TRUE
    );

    CREATE INDEX form_field_option_form_field_id_idx
      ON form_field_option (form_field_id);

    CREATE UNIQUE INDEX form_field_option_unique_idx
      ON form_field_option (form_field_id, definition);
  `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    DROP TABLE IF EXISTS form_field_option CASCADE;
  `)
}
