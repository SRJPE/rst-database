/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    ALTER TABLE trap_visit ALTER COLUMN created_at SET DEFAULT timezone('UTC'::text, timezone('America/Los_Angeles'::text, now()));
    ALTER TABLE trap_visit ALTER COLUMN updated_at SET DEFAULT timezone('UTC'::text, timezone('America/Los_Angeles'::text, now()));
    `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    ALTER TABLE trap_visit ALTER COLUMN created_at SET DEFAULT NOW();
    ALTER TABLE trap_visit ALTER COLUMN updated_at SET DEFAULT NOW();
    `)
}
