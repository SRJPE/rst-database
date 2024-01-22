/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    CREATE TABLE IF NOT EXISTS take_and_mortality (
      id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      permit_info_id INTEGER REFERENCES permit_info,
      species VARCHAR(50),
      listing_unit INTEGER REFERENCES listing_unit,
      fish_life_stage INTEGER REFERENCES life_stage,
      allowed_expected_take NUMERIC,
      allowed_mortality_count NUMERIC,
      comments VARCHAR(100)
    );

    ALTER TABLE permit_info DROP COLUMN species;
    ALTER TABLE permit_info DROP COLUMN listing_unit;
    ALTER TABLE permit_info DROP COLUMN fish_life_stage;
    ALTER TABLE permit_info DROP COLUMN allowed_expected_take;
    ALTER TABLE permit_info DROP COLUMN allowed_mortality_count;


    CREATE TABLE IF NOT EXISTS fish_condition (
      id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
      definition VARCHAR(100),
      created_at TIMESTAMP DEFAULT NOW(),
      updated_at TIMESTAMP DEFAULT NOW()
    );


    ALTER TABLE hatchery_info RENAME COLUMN aggrement_start_date TO agreement_start_date;
    ALTER TABLE hatchery_info RENAME COLUMN aggrement_end_date TO agreement_end_date;
  `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    DROP TABLE IF EXISTS take_and_mortality CASCADE;
    DROP TABLE IF EXISTS fish_condition CASCADE;

    ALTER TABLE permit_info ADD COLUMN species VARCHAR(10) REFERENCES taxon (code);
    ALTER TABLE permit_info ADD COLUMN listing_unit INTEGER REFERENCES listing_unit;
    ALTER TABLE permit_info ADD COLUMN fish_life_stage INTEGER REFERENCES life_stage;
    ALTER TABLE permit_info ADD COLUMN allowed_expected_take NUMERIC;
    ALTER TABLE permit_info ADD COLUMN allowed_mortality_count NUMERIC;

    ALTER TABLE hatchery_info RENAME COLUMN agreement_start_date TO aggrement_start_date;
    ALTER TABLE hatchery_info RENAME COLUMN agreement_end_date TO aggrement_end_date;
  `)
}
