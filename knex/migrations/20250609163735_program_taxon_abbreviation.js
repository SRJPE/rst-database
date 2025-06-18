/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
     CREATE TABLE IF NOT EXISTS program_taxon_abbreviation (
      id SERIAL PRIMARY KEY,
      program_id INTEGER REFERENCES program(id), 
      taxon_abbreviation_id INTEGER REFERENCES taxon_abbreviation(id) 
    );
  `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    DROP TABLE IF EXISTS program_taxon_abbreviation CASCADE;
    ALTER SEQUENCE taxon_abbreviation_id_seq RESTART WITH 1;
  `)
}
