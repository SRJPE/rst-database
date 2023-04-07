/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.up = function (knex) {
  return knex.raw(`
    ALTER TABLE trap_visit ALTER COLUMN program_id SET NOT NULL;
    ALTER TABLE trap_visit ALTER COLUMN trap_location_id SET NOT NULL;
    ALTER TABLE trap_visit ALTER COLUMN is_paper_entry SET DEFAULT FALSE;
    ALTER TABLE trap_visit ALTER COLUMN trap_visit_time_start SET NOT NULL;
    ALTER TABLE trap_visit ALTER COLUMN trap_visit_time_end SET NOT NULL;
    ALTER TABLE trap_visit ALTER COLUMN fish_processed SET NOT NULL;
    ALTER TABLE trap_visit ALTER COLUMN trap_functioning SET NOT NULL;
    ALTER TABLE trap_visit ALTER COLUMN trap_status_at_end SET NOT NULL;
    ALTER TABLE trap_visit ALTER COLUMN trap_status_at_end SET DEFAULT 1;
    ALTER TABLE trap_visit ALTER COLUMN rpm_at_start SET NOT NULL;
    ALTER TABLE trap_visit ALTER COLUMN rpm_at_end SET NOT NULL;
    ALTER TABLE trap_visit ALTER COLUMN in_half_cone_configuration SET DEFAULT FALSE;
    ALTER TABLE trap_visit ALTER COLUMN debris_volume_liters SET NOT NULL;

    ALTER TABLE trap_visit ADD CONSTRAINT why_fish_not_processed_check check
    (
      (fish_processed = 3 OR fish_processed = 4) AND why_fish_not_processed IS NOT NULL
      OR (fish_processed <> 3 AND fish_processed <> 4)
    );

    ALTER TABLE trap_visit ADD CONSTRAINT why_trap_not_functioning_check check
    (
      (trap_functioning = 2 OR trap_functioning = 3) AND why_trap_not_functioning IS NOT NULL
      OR (trap_functioning <> 2 AND trap_functioning <> 3)
    );
    `)
}

/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.down = function (knex) {
  return knex.raw(`
    ALTER TABLE trap_visit ALTER COLUMN program_id DROP NOT NULL;
    ALTER TABLE trap_visit ALTER COLUMN trap_location_id DROP NOT NULL;
    ALTER TABLE trap_visit ALTER COLUMN is_paper_entry DROP DEFAULT;
    ALTER TABLE trap_visit ALTER COLUMN trap_visit_time_start DROP NOT NULL;
    ALTER TABLE trap_visit ALTER COLUMN trap_visit_time_end DROP NOT NULL;
    ALTER TABLE trap_visit ALTER COLUMN fish_processed DROP NOT NULL;
    ALTER TABLE trap_visit ALTER COLUMN trap_functioning DROP NOT NULL;
    ALTER TABLE trap_visit ALTER COLUMN trap_status_at_end DROP NOT NULL;
    ALTER TABLE trap_visit ALTER COLUMN trap_status_at_end DROP DEFAULT;
    ALTER TABLE trap_visit ALTER COLUMN rpm_at_start DROP NOT NULL;
    ALTER TABLE trap_visit ALTER COLUMN rpm_at_end DROP NOT NULL;
    ALTER TABLE trap_visit ALTER COLUMN in_half_cone_configuration DROP DEFAULT;
    ALTER TABLE trap_visit ALTER COLUMN debris_volume_liters DROP NOT NULL;

    ALTER TABLE trap_visit DROP CONSTRAINT why_fish_not_processed_check RESTRICT;

    ALTER TABLE trap_visit DROP CONSTRAINT why_trap_not_functioning_check RESTRICT;
    `)
}
