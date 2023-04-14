/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    CREATE TABLE IF NOT EXISTS release_marks (
      id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      release_id INTEGER REFERENCES release,
      mark_type INTEGER references mark_type,
      mark_color INTEGER references mark_color,
      body_part INTEGER references body_part
    );
    
    ALTER TABLE release DROP COLUMN mark_color;
    ALTER TABLE release DROP COLUMN mark_type;
    ALTER TABLE release DROP COLUMN mark_position;
    `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    DROP TABLE IF EXISTS release_marks CASCADE;
    
    ALTER TABLE release ADD mark_color INTEGER REFERENCES mark_color;
    ALTER TABLE release ADD mark_type INTEGER REFERENCES mark_type;
    ALTER TABLE release ADD mark_position INTEGER REFERENCES body_part;
    `)
}
