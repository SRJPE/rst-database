/**
 * Widen trap_visit_environmental to fit user-defined form fields.
 *
 * measure_name stores a form field's field_name, but was VARCHAR(50) while
 * form_field.field_name is VARCHAR(100). An over-long name fails the INSERT and
 * 400s the *entire* trap visit POST, taking the crew's fish counts with it.
 *
 * measure_value_text is widened to 255 to leave headroom for a comma-joined
 * multi-select value (a single option definition is VARCHAR(100)).
 *
 * Widening a varchar(n) is a catalog-only change in PostgreSQL — no table
 * rewrite. The down migration truncates with left() so rollback cannot error on
 * rows written while the column was wide.
 *
 * Some deployments (e.g. YBFMP) have reporting views built directly on top of
 * trap_visit_environmental (discovered via a staging migration failure:
 * "cannot alter type of a column used by a view or rule" — Postgres refuses
 * to ALTER COLUMN TYPE while any view depends on it, even a plain SELECT).
 * Those views don't exist in this repo (created out-of-band, not tracked in
 * any migration), so this can't just DROP/CREATE VIEW with a hardcoded
 * definition — it has to discover whatever views currently depend on either
 * widened column, capture their exact live definition, drop them, run the
 * ALTER, then recreate them unchanged. Environments with no such view (local
 * dev, CI) see zero dependent views and this is a no-op wrapper around the
 * plain ALTER.
 *
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return alterAroundDependentViews(
    knex,
    `
      ALTER TABLE trap_visit_environmental
        ALTER COLUMN measure_name TYPE VARCHAR(100),
        ALTER COLUMN measure_value_text TYPE VARCHAR(255);
    `
  )
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return alterAroundDependentViews(
    knex,
    `
      ALTER TABLE trap_visit_environmental
        ALTER COLUMN measure_name TYPE VARCHAR(50) USING left(measure_name, 50),
        ALTER COLUMN measure_value_text TYPE VARCHAR(100) USING left(measure_value_text, 100);
    `
  )
}

/**
 * Finds every view depending on trap_visit_environmental.measure_name or
 * .measure_value_text (via Postgres' own dependency catalog, not a hardcoded
 * name — there may be more than one, and this repo doesn't know their
 * definitions), drops them, runs `alterSql`, then recreates each view from
 * the exact definition captured before dropping it.
 */
async function alterAroundDependentViews(knex, alterSql) {
  const { rows: dependentViews } = await knex.raw(`
    SELECT DISTINCT c.oid, n.nspname AS schema_name, c.relname AS view_name
    FROM pg_depend d
    JOIN pg_rewrite r ON r.oid = d.objid
    JOIN pg_class c ON c.oid = r.ev_class
    JOIN pg_namespace n ON n.oid = c.relnamespace
    JOIN pg_attribute a ON a.attrelid = d.refobjid AND a.attnum = d.refobjsubid
    WHERE d.refobjid = 'trap_visit_environmental'::regclass
      AND a.attname IN ('measure_name', 'measure_value_text')
      AND c.relkind = 'v'
  `)

  const captured = []
  for (const view of dependentViews) {
    const { rows } = await knex.raw(
      'SELECT pg_get_viewdef(?::regclass, true) AS definition',
      [view.oid]
    )
    captured.push({ ...view, definition: rows[0].definition })
    await knex.raw(
      `DROP VIEW "${view.schema_name}"."${view.view_name}"`
    )
  }

  await knex.raw(alterSql)

  for (const view of captured) {
    await knex.raw(
      `CREATE VIEW "${view.schema_name}"."${view.view_name}" AS ${view.definition}`
    )
  }
}
