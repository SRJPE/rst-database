/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function(knex) {
  return knex.raw(`
    ALTER TABLE trap_visit ALTER COLUMN rpm_at_start TYPE NUMERIC;
    ALTER TABLE trap_visit ALTER COLUMN rpm_at_end TYPE NUMERIC;
  `)
};

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
*/
exports.down = function(knex) {
  return knex.raw(`
    ALTER TABLE trap_visit ALTER COLUMN rpm_at_start TYPE INTEGER;
    ALTER TABLE trap_visit ALTER COLUMN rpm_at_end TYPE INTEGER;
  `)
  
};
