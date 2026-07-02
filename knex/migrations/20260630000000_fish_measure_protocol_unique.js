exports.up = function (knex) {
  return knex.raw(`
    CREATE UNIQUE INDEX fish_measure_protocol_unique_idx
    ON fish_measure_protocol (
      program_id,
      species,
      COALESCE(life_stage, -1),
      COALESCE(run, -1)
    )
  `)
}

exports.down = function (knex) {
  return knex.raw(`
    DROP INDEX IF EXISTS fish_measure_protocol_unique_idx
  `)
}
