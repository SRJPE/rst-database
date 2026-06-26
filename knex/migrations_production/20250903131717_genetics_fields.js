/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`

    CREATE TABLE IF NOT EXISTS take (
      id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      code varchar(10) NOT NULL,
      description text NOT NULL,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

    CREATE TABLE IF NOT EXISTS condition (
      id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      code varchar(10) NOT NULL,
      description text NOT NULL,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

    ALTER TABLE genetic_sampling_data ADD COLUMN take INTEGER NULL REFERENCES take;
    ALTER TABLE genetic_sampling_data ADD COLUMN condition INTEGER NULL REFERENCES condition;
    ALTER TABLE genetic_sampling_data ADD COLUMN genetic BOOLEAN NULL;
    ALTER TABLE genetic_sampling_data ADD COLUMN lab_weight numeric NULL;

    ALTER TYPE form_section_enum ADD VALUE IF NOT EXISTS 'Genetics';
    `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    ALTER TABLE genetic_sampling_data DROP COLUMN take;
    ALTER TABLE genetic_sampling_data DROP COLUMN condition;
    ALTER TABLE genetic_sampling_data DROP COLUMN genetic;
    ALTER TABLE genetic_sampling_data DROP COLUMN lab_weight;

    DROP TABLE IF EXISTS take CASCADE;
    DROP TABLE IF EXISTS condition CASCADE;
  `)
}
