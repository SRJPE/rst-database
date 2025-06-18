/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    CREATE TABLE IF NOT EXISTS length_at_date_delta (
      id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      lad_date date,
      fall_min_1 integer,
      fall_max_1 integer,
      spring_min_1 integer,
      spring_max_1 integer,
      winter_min_1 integer,
      winter_max_1 integer,
      late_fall_min_1 integer,
      late_fall_max_1 integer,
      fall_min_2 integer,
      fall_max_2 integer,
      spring_min_2 integer,
      spring_max_2 integer,
      winter_min_2 integer,
      winter_max_2 integer,
      late_fall_min_2 integer,
      late_fall_max_2 integer
    );

    ALTER TABLE length_at_date RENAME TO length_at_date_river;

    CREATE TYPE lad_model_enum AS ENUM ('river', 'delta');
    ALTER TABLE program ADD COLUMN lad_model lad_model_enum NOT NULL DEFAULT 'river';
  `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    DROP TABLE IF EXISTS length_at_date_delta CASCADE;
    DROP TABLE IF EXISTS length_at_date_river CASCADE;
    ALTER TABLE length_at_date_river RENAME TO length_at_date;

    ALTER TABLE program DROP COLUMN lad_model;

    DROP TYPE IF EXISTS lad_model_enum CASCADE;
  `)
}
