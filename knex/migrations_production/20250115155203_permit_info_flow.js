/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    ALTER TABLE permit_info DROP COLUMN trap_locations_id;
    ALTER TABLE permit_info DROP COLUMN flow_threshold;

    ALTER TABLE trap_locations ADD COLUMN flow_threshold NUMERIC NULL;
    `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    ALTER TABLE permit_info ADD COLUMN trap_locations_id INTEGER REFERENCES trap_locations;
    ALTER TABLE permit_info ADD COLUMN flow_threshold NUMERIC NULL;
    
    ALTER TABLE trap_locations DROP COLUMN flow_threshold;
    DROP TYPE IF EXISTS role_enum CASCADE;
    `)
}
