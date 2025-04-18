/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    ALTER TABLE trap_visit_crew ADD COLUMN data_recorder BOOLEAN NULL;
    ALTER TABLE trap_visit_crew ADD COLUMN field_check BOOLEAN NULL;

    ALTER TABLE trap_locations ADD COLUMN equipment_id INTEGER references equipment;

    ALTER TABLE program_fields ADD COLUMN equipment_id INTEGER references equipment;
    `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    ALTER TABLE trap_visit_crew DROP COLUMN data_recorder;
    ALTER TABLE trap_visit_crew DROP COLUMN field_check;
    ALTER TABLE trap_locations DROP COLUMN equipment_id;
    ALTER TABLE program_fields DROP COLUMN equipment_id;
    `)
}
