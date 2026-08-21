/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    ALTER TABLE trap_visit_crew
      ADD CONSTRAINT trap_visit_crew_unique UNIQUE (personnel_id, trap_visit_id);
    ALTER TABLE release_crew
      ADD CONSTRAINT release_crew_unique UNIQUE (personnel_id, release_id);
    ALTER TABLE genetic_sampling_crew
      ADD CONSTRAINT genetic_sampling_crew_unique UNIQUE (personnel_id, genetic_sampling_data_id);
    ALTER TABLE mark_applied_crew
      ADD CONSTRAINT mark_applied_crew_unique UNIQUE (personnel, mark_applied_id);
    ALTER TABLE catch_fish_condition
      ADD CONSTRAINT catch_fish_condition_unique UNIQUE (catch_raw_id, fish_condition_id);
    `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    ALTER TABLE trap_visit_crew DROP CONSTRAINT trap_visit_crew_unique;
    ALTER TABLE release_crew DROP CONSTRAINT release_crew_unique;
    ALTER TABLE genetic_sampling_crew DROP CONSTRAINT genetic_sampling_crew_unique;
    ALTER TABLE mark_applied_crew DROP CONSTRAINT mark_applied_crew_unique;
    ALTER TABLE catch_fish_condition DROP CONSTRAINT catch_fish_condition_unique;
    `)
}
