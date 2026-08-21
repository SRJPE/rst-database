/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    CREATE TABLE IF NOT EXISTS catch_raw_conditional_values (
        id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
        catch_raw_id INTEGER REFERENCES catch_raw,
        measure_name VARCHAR(50),
        measure_value_numeric NUMERIC,
        measure_value_text VARCHAR(100),
        measure_unit INTEGER REFERENCES unit
    );
    `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    DROP TABLE IF EXISTS catch_raw_conditional_values CASCADE;
    `)
}
