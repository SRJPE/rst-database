/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    ALTER TABLE program_personnel_team
      ADD CONSTRAINT program_personnel_team_personnel_id_program_id_unique UNIQUE (personnel_id, program_id);
    `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    ALTER TABLE program_personnel_team
      DROP CONSTRAINT program_personnel_team_personnel_id_program_id_unique;
    `)
}
