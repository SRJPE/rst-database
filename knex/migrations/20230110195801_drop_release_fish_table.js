/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */

// drop release_fish table
// DROP TABLE IF EXISTS release_fish CASCADE;

// ALTER TABLE table_name
// ADD column_name datatype;
exports.up = function(knex) {
  return knex.raw(`
    DROP TABLE IF EXISTS release_fish CASCADE;
    
    ALTER TABLE catch_raw ADD marked_for_release BOOLEAN;
    `)
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */

// create release_fish table
// remove column marked for release
// ALTER TABLE table_name
// DROP COLUMN column_name;
exports.down = function(knex) {
  return knex.raw(`
    CREATE TABLE IF NOT EXISTS release_fish (
      id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      program_id INTEGER REFERENCES program,
      release_id INTEGER REFERENCES release,
      catch_raw_id VARCHAR(25)
    );

    ALTER TABLE catch_raw DROP COLUMN marked_for_release;
  `)
};
