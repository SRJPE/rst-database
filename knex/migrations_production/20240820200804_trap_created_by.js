/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    ALTER TABLE trap_visit ADD COLUMN created_by INTEGER REFERENCES personnel;
    ALTER TABLE trap_visit ADD COLUMN qc_completed_by INTEGER REFERENCES personnel;
    `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    ALTER TABLE trap_visit DROP COLUMN created_by;
    ALTER TABLE trap_visit DROP COLUMN qc_completed_by;
    `)
}
