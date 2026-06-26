/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    CREATE TABLE IF NOT EXISTS length_at_date (
      id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      lad_date text,
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
  `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
      DROP TABLE IF EXISTS length_at_date CASCADE;
  `)
}
