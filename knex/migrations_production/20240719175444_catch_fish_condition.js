/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    CREATE TABLE IF NOT EXISTS catch_fish_condition (
      id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      catch_raw_id INTEGER REFERENCES catch_raw,
      fish_condition_id INTEGER REFERENCES fish_condition
    );
  `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
      DROP TABLE IF EXISTS catch_fish_condition CASCADE;
  `)
}
