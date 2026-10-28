/**
 * Adds a client-generated idempotency key to catch_raw so a retried/resumed
 * offline submission (the trap-visit form posts one catch_raw batch per trap
 * tab) can't silently insert the same fish twice. The mobile/dashboard
 * clients already generate a stable UID per fish record at data-entry time
 * (rst-pilot-app-client's fishInputSlice/AddFish.tsx) - this just gives the
 * server a place to store and enforce it. Nullable + a partial unique index
 * (not a NOT NULL column or table-wide constraint) so existing rows and any
 * client that doesn't yet send one are unaffected.
 *
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    ALTER TABLE catch_raw ADD COLUMN client_uid VARCHAR(50);
    CREATE UNIQUE INDEX catch_raw_client_uid_unique
    ON catch_raw (trap_visit_id, client_uid)
    WHERE client_uid IS NOT NULL;
    `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    DROP INDEX IF EXISTS catch_raw_client_uid_unique;
    ALTER TABLE catch_raw DROP COLUMN IF EXISTS client_uid;
    `)
}
