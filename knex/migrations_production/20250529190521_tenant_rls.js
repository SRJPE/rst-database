/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    CREATE TABLE IF NOT EXISTS tenant_personnel (
      id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      tenant varchar(20) NOT NULL,
      personnel_id INTEGER REFERENCES personnel
    );
  `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
      DROP TABLE IF EXISTS tenant_personnel CASCADE;
  `)
}
