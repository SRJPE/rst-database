/**
 * Pilot: program-scopes `substrate` (a legacy select-type form_field whose
 * real options live in a dedicated FK'd lookup table, predating
 * form_field_option) — mirroring the exact null-vs-specific convention
 * already proven on form_field_option and taxon_abbreviation.
 *
 * program_id IS NULL means the row is a shared default visible to every
 * program; a specific program_id means the row exists only for that
 * program. No unique constraint (consistent with taxon_abbreviation) — a
 * program legitimately duplicating an existing option's text under its own
 * row is fine, since dedupe-by-text happens at merge time, not insert time.
 *
 * `active` lets a program retire an option without hard-deleting it —
 * unlike form_field_option/taxon_abbreviation, substrate IS a literal FK
 * target (`trap_visit.substrate REFERENCES substrate`), so a row a real
 * historical trap_visit references can never be deleted without either
 * violating that FK or orphaning history. Deactivating just excludes it
 * from future selection.
 *
 * program_lookup_settings is generic on purpose (keyed by form_field_id,
 * not a table name) so the SAME opt-out-of-globals mechanism can be reused
 * for the other legacy lookup fields (tide_code, gear_status, etc.) if this
 * pilot proves out, without another migration.
 *
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    ALTER TABLE substrate
      ADD COLUMN program_id INTEGER REFERENCES program,
      ADD COLUMN active BOOLEAN NOT NULL DEFAULT TRUE;

    CREATE TABLE IF NOT EXISTS program_lookup_settings (
      id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      program_id INTEGER NOT NULL REFERENCES program,
      form_field_id INTEGER NOT NULL REFERENCES form_field,
      exclude_global_options BOOLEAN NOT NULL DEFAULT FALSE,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

    CREATE UNIQUE INDEX program_lookup_settings_unique_idx
      ON program_lookup_settings (program_id, form_field_id);
  `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    DROP TABLE IF EXISTS program_lookup_settings CASCADE;

    ALTER TABLE substrate
      DROP COLUMN program_id,
      DROP COLUMN active;
  `)
}
