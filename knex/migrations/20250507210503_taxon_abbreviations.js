/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
     CREATE TABLE IF NOT EXISTS taxon_abbreviation (
      id SERIAL PRIMARY KEY,
      taxon_code VARCHAR(10) REFERENCES taxon(code),
      abbreviation_code VARCHAR(100),
      is_full_name BOOLEAN NOT NULL DEFAULT FALSE
    );
  `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    DROP TABLE IF EXISTS taxon_abbreviation CASCADE;
  `)
}
