/**
 * Program-scopes form_field_option, mirroring the null-vs-specific convention
 * program_fields.equipment_id already uses: program_id IS NULL means the
 * option is a shared default available to every program using this field;
 * a specific program_id means the option (or an override of a shared one,
 * via `active`) only exists for that program.
 *
 * Without this, two programs attaching to the same global form_field catalog
 * entry (via the "Existing Field" picker) were forced to share one option
 * list, with no way for either program to add its own — the same
 * cross-program leakage concern raised about the legacy lookup tables
 * (tide_code, fish_condition, etc.), just in the newest code in the app.
 *
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    ALTER TABLE form_field_option
      ADD COLUMN program_id INTEGER REFERENCES program;

    DROP INDEX IF EXISTS form_field_option_unique_idx;

    CREATE UNIQUE INDEX form_field_option_unique_idx
      ON form_field_option (
        form_field_id,
        COALESCE(program_id, -1),
        definition
      );
  `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    DROP INDEX IF EXISTS form_field_option_unique_idx;

    CREATE UNIQUE INDEX form_field_option_unique_idx
      ON form_field_option (form_field_id, definition);

    ALTER TABLE form_field_option
      DROP COLUMN program_id;
  `)
}
