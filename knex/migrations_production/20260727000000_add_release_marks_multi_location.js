/**
 * Multi-mark-group release trials (opt-in, backward compatible).
 *
 * Adds two nullable columns to release_marks so a single release can carry
 * per-mark release location + fish count. Existing rows stay null — no
 * backfill. The parent release.release_site_id is unchanged and still drives
 * the traditional single-location flow.
 *
 * NOTE: table is release_marks (plural) — the app queries knex('releaseMarks')
 * which maps to release_marks. release_site is singular.
 */
exports.up = async function (knex) {
  await knex.raw(`
    ALTER TABLE release_marks
      ADD COLUMN fish_count      integer DEFAULT NULL,
      ADD COLUMN release_site_id integer REFERENCES release_site(id) DEFAULT NULL
  `)
}

exports.down = async function (knex) {
  await knex.raw(`
    ALTER TABLE release_marks
      DROP COLUMN IF EXISTS release_site_id,
      DROP COLUMN IF EXISTS fish_count
  `)
}
