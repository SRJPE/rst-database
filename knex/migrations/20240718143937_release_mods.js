/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    ALTER TABLE release ADD CONSTRAINT unique_release UNIQUE (release_site_id, released_at);
    ALTER TABLE release ADD COLUMN hatchery_fish_fork_length NUMERIC NULL;
    `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    ALTER TABLE release DROP CONSTRAINT unique_release;
    ALTER TABLE release DROP COLUMN hatchery_fish_fork_length;
    `)
}
