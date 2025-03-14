/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    ALTER TABLE trap_visit ADD COLUMN vegetation_code INTEGER NULL REFERENCES vegetation_code;
    ALTER TABLE trap_visit ADD COLUMN condition_code INTEGER NULL REFERENCES condition_code;
    ALTER TABLE trap_visit ADD COLUMN gear_status INTEGER NULL REFERENCES gear_status;
    ALTER TABLE trap_visit ADD COLUMN ysi_num INTEGER NULL REFERENCES ysi_num;
    ALTER TABLE trap_visit ADD COLUMN rev_counter INTEGER NULL;
    ALTER TABLE trap_visit ADD COLUMN tide_code INTEGER REFERENCES tide_code;
    ALTER TABLE trap_visit ADD COLUMN flow_direction INTEGER REFERENCES flow_direction;
    ALTER TABLE trap_visit ADD COLUMN weather_code INTEGER REFERENCES weather_code;

    CREATE TYPE field_type_enum AS ENUM ('input', 'select', 'multi-select', 'radio', 'checkbox', 'textarea');
    CREATE TYPE form_section_enum AS ENUM ('Visit Setup', 'Trap Operations', 'Fish Processing', 'Fish Input', 'Trap Post-Processing');


    CREATE TABLE IF NOT EXISTS form_field (
      id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      field_name VARCHAR(100) NOT NULL,
      display_name VARCHAR(100) NOT NULL,
      unit_id INTEGER REFERENCES unit NULL,
      field_type field_type_enum NOT NULL,
      min_threshold INTEGER,
      max_threshold INTEGER
    );

    CREATE TABLE IF NOT EXISTS program_fields (
      id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      program_id INTEGER REFERENCES program,
      form_field_id INTEGER REFERENCES form_field,
      required BOOLEAN NOT NULL,
      form_section form_section_enum NOT NULL,
      order_index INTEGER
    );

    `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    ALTER TABLE trap_visit DROP COLUMN vegetation_code;
    ALTER TABLE trap_visit DROP COLUMN condition_code;
    ALTER TABLE trap_visit DROP COLUMN gear_status;

    DROP TABLE IF EXISTS form_field CASCADE;
    DROP TABLE IF EXISTS program_fields CASCADE;
    DROP TYPE IF EXISTS field_type_enum;
    DROP TYPE IF EXISTS form_section_enum;
    `)
}
