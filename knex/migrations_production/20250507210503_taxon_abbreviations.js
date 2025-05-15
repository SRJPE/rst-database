/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
     CREATE TABLE IF NOT EXISTS taxon_abbreviation (
      id SERIAL PRIMARY KEY,
      taxon_code VARCHAR(10) REFERENCES taxon(code),
      abbreviation_code VARCHAR(10)
    );
  `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  knex.raw(`
    DROP TABLE IF EXISTS taxon_abbreviation CASCADE;
  `)
}
