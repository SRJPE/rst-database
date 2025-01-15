/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    ALTER TABLE trap_locations ADD COLUMN flow_threshold NUMERIC NULL;

    ALTER TABLE permit_info DROP COLUMN trap_locations_id;
    ALTER TABLE permit_info DROP COLUMN flow_threshold;

    CREATE TYPE permit_type_enum AS ENUM ('4d', 'SCP', 'other');
    ALTER TABLE permit_info ADD COLUMN permit_type permit_type_enum NULL;
    `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    ALTER TABLE trap_locations DROP COLUMN flow_threshold;

    ALTER TABLE permit_info ADD COLUMN trap_locations_id INTEGER REFERENCES trap_locations;
    ALTER TABLE permit_info ADD COLUMN flow_threshold NUMERIC NULL;

    ALTER TABLE permit_info DROP COLUMN permit_type;
    DROP TYPE IF EXISTS permit_type_enum CASCADE;
    `)
}
