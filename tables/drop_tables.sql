-- ENUMS
DROP TYPE IF EXISTS role_enum CASCADE;
DROP TYPE IF EXISTS fish_life_stage_enum CASCADE;

-- LOOKUPS
DROP TABLE IF EXISTS visit_type CASCADE;
DROP TABLE IF EXISTS taxon CASCADE;
DROP TABLE IF EXISTS listing_unit CASCADE;
DROP TABLE IF EXISTS frequency CASCADE;
DROP TABLE IF EXISTS why_trap_not_functioning CASCADE;
DROP TABLE IF EXISTS why_fish_not_processed CASCADE;
DROP TABLE IF EXISTS agency CASCADE;
DROP TABLE IF EXISTS equipment CASCADE;
DROP TABLE IF EXISTS trap_status_at_end CASCADE;
DROP TABLE IF EXISTS trap_functionality CASCADE;
DROP TABLE IF EXISTS fish_processed CASCADE;
DROP TABLE IF EXISTS run CASCADE;
DROP TABLE IF EXISTS run_code_method CASCADE;
DROP TABLE IF EXISTS life_stage CASCADE;
DROP TABLE IF EXISTS release_purpose CASCADE;
DROP TABLE IF EXISTS mark_type CASCADE;
DROP TABLE IF EXISTS mark_color CASCADE;
DROP TABLE IF EXISTS body_part CASCADE;
DROP TABLE IF EXISTS plus_count_methodology CASCADE;
DROP TABLE IF EXISTS unit CASCADE;


-- MAIN
DROP TABLE IF EXISTS personnel CASCADE;
DROP TABLE IF EXISTS program CASCADE;
DROP TABLE IF EXISTS program_personnel_team CASCADE;
DROP TABLE IF EXISTS permit_info CASCADE;
DROP TABLE IF EXISTS hatchery_info CASCADE;
DROP TABLE IF EXISTS fish_measure_protocol CASCADE;
DROP TABLE IF EXISTS trap_locations CASCADE;
DROP TABLE IF EXISTS trap_visit CASCADE;
DROP TABLE IF EXISTS trap_coordinates CASCADE;
DROP TABLE IF EXISTS trap_visit_crew CASCADE;
DROP TABLE IF EXISTS trap_visit_environmental CASCADE;
DROP TABLE IF EXISTS release_site CASCADE;
DROP TABLE IF EXISTS release CASCADE;
DROP TABLE IF EXISTS release_crew CASCADE;
DROP TABLE IF EXISTS catch_raw CASCADE;
DROP TABLE IF EXISTS genetic_sampling_data CASCADE;
DROP TABLE IF EXISTS genetic_sampling_crew CASCADE;
DROP TABLE IF EXISTS release_fish CASCADE;
DROP TABLE IF EXISTS mark_applied CASCADE;
DROP TABLE IF EXISTS mark_applied_crew CASCADE;
DROP TABLE IF EXISTS existing_marks CASCADE;