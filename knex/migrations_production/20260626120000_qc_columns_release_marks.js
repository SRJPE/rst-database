/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    ALTER TABLE release ADD COLUMN qc_completed BOOLEAN;
    ALTER TABLE release ADD COLUMN qc_completed_by INTEGER REFERENCES personnel;
    ALTER TABLE release ADD COLUMN qc_time TIMESTAMP;

    ALTER TABLE existing_marks ADD COLUMN qc_completed BOOLEAN;
    ALTER TABLE existing_marks ADD COLUMN qc_completed_by INTEGER REFERENCES personnel;
    ALTER TABLE existing_marks ADD COLUMN qc_time TIMESTAMP;

    ALTER TABLE mark_applied ADD COLUMN qc_completed BOOLEAN;
    ALTER TABLE mark_applied ADD COLUMN qc_completed_by INTEGER REFERENCES personnel;
    ALTER TABLE mark_applied ADD COLUMN qc_time TIMESTAMP;
    `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    ALTER TABLE release DROP COLUMN qc_completed;
    ALTER TABLE release DROP COLUMN qc_completed_by;
    ALTER TABLE release DROP COLUMN qc_time;

    ALTER TABLE existing_marks DROP COLUMN qc_completed;
    ALTER TABLE existing_marks DROP COLUMN qc_completed_by;
    ALTER TABLE existing_marks DROP COLUMN qc_time;

    ALTER TABLE mark_applied DROP COLUMN qc_completed;
    ALTER TABLE mark_applied DROP COLUMN qc_completed_by;
    ALTER TABLE mark_applied DROP COLUMN qc_time;
    `)
}
