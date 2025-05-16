/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    CREATE TABLE IF NOT EXISTS condition_code (
      id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      code varchar(10) NOT NULL,
      description text NOT NULL,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

    CREATE TABLE IF NOT EXISTS vegetation_code (
      id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      code varchar(10) NOT NULL,
      description text NOT NULL,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

    CREATE TABLE IF NOT EXISTS tide_code (
      id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      code varchar(10) NOT NULL,
      description text NOT NULL,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

    CREATE TABLE IF NOT EXISTS flow_direction (
      id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      code varchar(10) NOT NULL,
      description text NOT NULL,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

    CREATE TABLE IF NOT EXISTS weather_code (
      id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      code varchar(10) NOT NULL,
      description text NOT NULL,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
    
    CREATE TABLE IF NOT EXISTS substrate (
      id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      code varchar(10) NOT NULL,
      description text NOT NULL,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

    CREATE TABLE IF NOT EXISTS gear_status (
      id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      code varchar(10) NOT NULL,
      description text NOT NULL,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );

    CREATE TABLE IF NOT EXISTS ysi_num (
      id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      code varchar(10) NOT NULL,
      description text NOT NULL,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
      updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
  `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
      DROP TABLE IF EXISTS condition_code CASCADE;
      DROP TABLE IF EXISTS vegetation_code CASCADE;
      DROP TABLE IF EXISTS tide_code CASCADE;
      DROP TABLE IF EXISTS flow_direction CASCADE;
      DROP TABLE IF EXISTS weather_code CASCADE;
      DROP TABLE IF EXISTS substrate CASCADE;
      DROP TABLE IF EXISTS gear_status CASCADE;
      DROP TABLE IF EXISTS ysi_num CASCADE;
  `)
}
