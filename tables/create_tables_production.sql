------ ENUMS ------
CREATE TYPE role_enum AS ENUM ('lead', 'non-lead', 'not recorded');

-- agency definition

CREATE TABLE IF NOT EXISTS agency (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	definition varchar(100) NULL,
	description varchar(200) NULL,
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now()
);


-- body_part definition

CREATE TABLE IF NOT EXISTS body_part (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	definition varchar(100) NULL,
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now()
);


-- equipment definition

CREATE TABLE IF NOT EXISTS equipment (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	definition varchar(100) NULL,
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now()
);


-- fish_condition definition

CREATE TABLE IF NOT EXISTS fish_condition (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	definition varchar(100) NULL,
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now()
);


-- fish_processed definition

CREATE TABLE IF NOT EXISTS fish_processed (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	definition varchar(100) NULL,
	description varchar(200) NULL,
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now()
);


-- frequency definition

CREATE TABLE IF NOT EXISTS frequency (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	definition varchar(100) NULL,
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now()
);

-- life_stage definition

CREATE TABLE IF NOT EXISTS life_stage (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	definition varchar(100) NULL,
	description varchar(200) NULL,
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now()
);


-- listing_unit definition

CREATE TABLE IF NOT EXISTS listing_unit (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	definition varchar(100) NULL,
	associated_species varchar(20) NULL,
	run varchar(20) NULL,
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now()
);


-- mark_color definition

CREATE TABLE IF NOT EXISTS mark_color (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	definition varchar(100) NULL,
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now()
);


-- mark_type definition

CREATE TABLE IF NOT EXISTS mark_type (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	definition varchar(100) NULL,
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now()
);


-- plus_count_methodology definition

CREATE TABLE IF NOT EXISTS plus_count_methodology (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	definition varchar(100) NULL,
	description varchar(200) NULL,
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now()
);


-- release_purpose definition

CREATE TABLE IF NOT EXISTS release_purpose (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	definition varchar(100) NULL,
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now()
);


-- run definition

CREATE TABLE IF NOT EXISTS run (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	definition varchar(100) NULL,
	description varchar(200) NULL,
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now()
);


-- run_code_method definition

CREATE TABLE IF NOT EXISTS run_code_method (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	definition varchar(100) NULL,
	description varchar(200) NULL,
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now()
);


-- taxon definition

CREATE TABLE IF NOT EXISTS taxon (
	code varchar(10) NOT NULL,
	commonName VARCHAR(50),
	latinName VARCHAR(50),
	kingdomCommon VARCHAR(50),
	phylumCommon VARCHAR(50),
	classCommon VARCHAR(50),
	orderCommon VARCHAR(50),
	familyCommon VARCHAR(50),
	genusCommon VARCHAR(50),
	speciesCommon VARCHAR(50),
	subspeciesCommon VARCHAR(50),
	kingdomLatin VARCHAR(50),
	phylumLatin VARCHAR(50),
	classLatin VARCHAR(50),
	orderLatin VARCHAR(50),
	familyLatin VARCHAR(50),
	genusLatin VARCHAR(50),
	speciesLatin VARCHAR(50),
	subspeciesLatin VARCHAR(50),
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now(),
	CONSTRAINT taxon_pkey PRIMARY KEY (code)
);


-- trap_functionality definition

CREATE TABLE IF NOT EXISTS trap_functionality (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	definition varchar(100) NULL,
	description varchar(200) NULL,
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now()
);


-- trap_status_at_end definition

CREATE TABLE IF NOT EXISTS trap_status_at_end (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	definition varchar(100) NULL,
	description varchar(200) NULL,
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now()
);


-- unit definition

CREATE TABLE IF NOT EXISTS unit (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	definition varchar(100) NULL,
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now()
);


-- visit_type definition

CREATE TABLE IF NOT EXISTS visit_type (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	definition varchar(100) NULL,
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now()
);


-- why_fish_not_processed definition

CREATE TABLE IF NOT EXISTS why_fish_not_processed (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	definition varchar(100) NULL,
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now()
);


-- why_trap_not_functioning definition

CREATE TABLE IF NOT EXISTS why_trap_not_functioning (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	definition varchar(100) NULL,
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now()
);


-- personnel definition

CREATE TABLE IF NOT EXISTS personnel (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	first_name varchar(25) NULL,
	last_name varchar(25) NULL,
	email varchar(50) NULL,
	phone varchar(12) NULL,
	agency_id int4 NULL,
	"role" "role_enum" NULL,
	orcid_id varchar(25) NULL,
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now(),
	CONSTRAINT personnel_agency_id_fkey FOREIGN KEY (agency_id) REFERENCES agency(id)
);


-- program definition

CREATE TABLE IF NOT EXISTS program (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	program_name varchar(25) NULL,
	stream_name varchar(25) NULL,
	personnel_lead int4 NULL,
	funding_agency int4 NULL,
	efficiency_protocols_document_link varchar(200) NULL,
	trapping_protocols_document_link varchar(200) NULL,
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now(),
	CONSTRAINT program_funding_agency_fkey FOREIGN KEY (funding_agency) REFERENCES agency(id),
	CONSTRAINT program_personnel_lead_fkey FOREIGN KEY (personnel_lead) REFERENCES personnel(id)
);


-- program_personnel_team definition

CREATE TABLE IF NOT EXISTS program_personnel_team (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	personnel_id int4 NULL,
	program_id int4 NULL,
	CONSTRAINT program_personnel_team_personnel_id_fkey FOREIGN KEY (personnel_id) REFERENCES personnel(id),
	CONSTRAINT program_personnel_team_program_id_fkey FOREIGN KEY (program_id) REFERENCES program(id)
);


-- trap_locations definition

CREATE TABLE IF NOT EXISTS trap_locations (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	trap_name varchar(50) NULL,
	program_id int4 NULL,
	data_recorder_id int4 NULL,
	data_recorder_agency_id int4 NULL,
	site_name varchar(50) NULL,
	cone_size_ft numeric NULL,
	x_coord numeric NULL,
	y_coord numeric NULL,
	coordinate_system varchar(100) NULL,
	projection varchar(100) NULL,
	datum varchar(100) NULL,
	gage_number numeric NULL,
	gage_agency int4 NULL,
	"comments" varchar(500) NULL,
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now(),
	CONSTRAINT trap_locations_data_recorder_agency_id_fkey FOREIGN KEY (data_recorder_agency_id) REFERENCES agency(id),
	CONSTRAINT trap_locations_data_recorder_id_fkey FOREIGN KEY (data_recorder_id) REFERENCES personnel(id),
	CONSTRAINT trap_locations_gage_agency_fkey FOREIGN KEY (gage_agency) REFERENCES agency(id),
	CONSTRAINT trap_locations_program_id_fkey FOREIGN KEY (program_id) REFERENCES program(id)
);


-- trap_visit definition

CREATE TABLE IF NOT EXISTS trap_visit (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	program_id int4 NOT NULL,
	visit_type_id int4 NULL,
	trap_location_id int4 NOT NULL,
	is_paper_entry bool NULL DEFAULT false,
	trap_visit_time_start timestamp NOT NULL,
	trap_visit_time_end timestamp NOT NULL,
	fish_processed int4 NOT NULL,
	why_fish_not_processed int4 NULL,
	sample_gear_id int4 NULL,
	cone_depth numeric NULL,
	trap_in_thalweg bool NULL,
	trap_functioning int4 NOT NULL,
	why_trap_not_functioning int4 NULL,
	trap_status_at_end int4 NOT NULL DEFAULT 1,
	total_revolutions int4 NULL,
	rpm_at_start numeric NOT NULL,
	rpm_at_end numeric NOT NULL,
	in_half_cone_configuration bool NULL DEFAULT false,
	debris_volume_liters int4 NOT NULL,
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now(),
	qc_completed bool NULL,
	qc_completed_at timestamp NULL,
	"comments" varchar(100) NULL,
	CONSTRAINT why_fish_not_processed_check CHECK (((((fish_processed = 3) OR (fish_processed = 4)) AND (why_fish_not_processed IS NOT NULL)) OR ((fish_processed <> 3) AND (fish_processed <> 4)))),
	CONSTRAINT why_trap_not_functioning_check CHECK (((((trap_functioning = 2) OR (trap_functioning = 3)) AND (why_trap_not_functioning IS NOT NULL)) OR ((trap_functioning <> 2) AND (trap_functioning <> 3)))),
	CONSTRAINT trap_visit_fish_processed_fkey FOREIGN KEY (fish_processed) REFERENCES fish_processed(id),
	CONSTRAINT trap_visit_program_id_fkey FOREIGN KEY (program_id) REFERENCES program(id),
	CONSTRAINT trap_visit_sample_gear_id_fkey FOREIGN KEY (sample_gear_id) REFERENCES equipment(id),
	CONSTRAINT trap_visit_trap_functioning_fkey FOREIGN KEY (trap_functioning) REFERENCES trap_functionality(id),
	CONSTRAINT trap_visit_trap_location_id_fkey FOREIGN KEY (trap_location_id) REFERENCES trap_locations(id),
	CONSTRAINT trap_visit_trap_status_at_end_fkey FOREIGN KEY (trap_status_at_end) REFERENCES trap_status_at_end(id),
	CONSTRAINT trap_visit_visit_type_id_fkey FOREIGN KEY (visit_type_id) REFERENCES visit_type(id),
	CONSTRAINT trap_visit_why_fish_not_processed_fkey FOREIGN KEY (why_fish_not_processed) REFERENCES why_fish_not_processed(id),
	CONSTRAINT trap_visit_why_trap_not_functioning_fkey FOREIGN KEY (why_trap_not_functioning) REFERENCES why_trap_not_functioning(id),
	CONSTRAINT unique_trap_visit UNIQUE (program_id, trap_location_id, trap_visit_time_start)
);


-- trap_visit_crew definition

CREATE TABLE IF NOT EXISTS trap_visit_crew (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	personnel_id int4 NULL,
	trap_visit_id int4 NULL,
	CONSTRAINT trap_visit_crew_personnel_id_fkey FOREIGN KEY (personnel_id) REFERENCES personnel(id),
	CONSTRAINT trap_visit_crew_trap_visit_id_fkey FOREIGN KEY (trap_visit_id) REFERENCES trap_visit(id)
);


-- trap_visit_environmental definition

CREATE TABLE IF NOT EXISTS trap_visit_environmental (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	trap_visit_id int4 NULL,
	measure_name varchar(50) NULL,
	measure_value_numeric numeric NULL,
	measure_value_text varchar(100) NULL,
	measure_unit int4 NULL,
	CONSTRAINT trap_visit_environmental_measure_unit_fkey FOREIGN KEY (measure_unit) REFERENCES unit(id),
	CONSTRAINT trap_visit_environmental_trap_visit_id_fkey FOREIGN KEY (trap_visit_id) REFERENCES trap_visit(id)
);


-- fish_measure_protocol definition

CREATE TABLE IF NOT EXISTS fish_measure_protocol (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	program_id int4 NULL,
	species varchar(10) NULL,
	life_stage int4 NULL,
	run int4 NULL,
	number_measured numeric NULL,
	CONSTRAINT fish_measure_protocol_life_stage_fkey FOREIGN KEY (life_stage) REFERENCES life_stage(id),
	CONSTRAINT fish_measure_protocol_program_id_fkey FOREIGN KEY (program_id) REFERENCES program(id),
	CONSTRAINT fish_measure_protocol_run_fkey FOREIGN KEY (run) REFERENCES run(id),
	CONSTRAINT fish_measure_protocol_species_fkey FOREIGN KEY (species) REFERENCES taxon(code)
);


-- hatchery_info definition

CREATE TABLE IF NOT EXISTS hatchery_info (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	hatchery_name varchar(25) NULL,
	stream_name varchar(25) NULL,
	agreement_id varchar(25) NULL,
	program_id int4 NULL,
	agreement_start_date date NULL,
	agreement_end_date date NULL,
	renewal_date date NULL,
	frequency_of_fish_collection int4 NULL,
	quantity_of_fish numeric NULL,
	hatchery_file_link varchar(200) NULL,
	CONSTRAINT hatchery_info_frequency_of_fish_collection_fkey FOREIGN KEY (frequency_of_fish_collection) REFERENCES frequency(id),
	CONSTRAINT hatchery_info_program_id_fkey FOREIGN KEY (program_id) REFERENCES program(id)
);


-- permit_info definition

CREATE TABLE IF NOT EXISTS permit_info (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	permit_id varchar(25) NULL,
	program_id int4 NULL,
	stream_name varchar(25) NULL,
	permit_start_date date NULL,
	permit_end_date date NULL,
	flow_threshold numeric NULL,
	temperature_threshold numeric NULL,
	frequency_sampling_inclement_weather numeric NULL,
	permit_file_link varchar(200) NULL,
	CONSTRAINT permit_info_program_id_fkey FOREIGN KEY (program_id) REFERENCES program(id)
);


-- release_site definition

CREATE TABLE IF NOT EXISTS release_site (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	trap_locations_id int4 NULL,
	release_site_name varchar(50) NULL,
	release_site_x_coord numeric NULL,
	release_site_y_coord numeric NULL,
	release_site_coordinate_system varchar(50) NULL,
	release_site_datum varchar(50) NULL,
	release_site_projection varchar(50) NULL,
	CONSTRAINT release_site_trap_locations_id_fkey FOREIGN KEY (trap_locations_id) REFERENCES trap_locations(id)
);


-- take_and_mortality definition

CREATE TABLE IF NOT EXISTS take_and_mortality (
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  permit_info_id INTEGER REFERENCES permit_info,
  species VARCHAR(10),
  listing_unit INTEGER REFERENCES listing_unit,
  fish_life_stage INTEGER REFERENCES life_stage,
  allowed_expected_take NUMERIC,
  allowed_mortality_count NUMERIC,
  comments VARCHAR(100),
	CONSTRAINT take_and_mortality_species_fkey FOREIGN KEY (species) REFERENCES taxon(code)
);


-- trap_coordinates definition

CREATE TABLE IF NOT EXISTS trap_coordinates (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	trap_visit_id int4 NULL,
	trap_locations_id int4 NULL,
	x_coord numeric NULL,
	y_coord numeric NULL,
	datum varchar(100) NULL,
	projection varchar(100) NULL,
	CONSTRAINT trap_coordinates_trap_locations_id_fkey FOREIGN KEY (trap_locations_id) REFERENCES trap_locations(id),
	CONSTRAINT trap_coordinates_trap_visit_id_fkey FOREIGN KEY (trap_visit_id) REFERENCES trap_visit(id)
);


-- release definition

CREATE TABLE IF NOT EXISTS release (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	program_id int4 NULL,
	release_purpose_id int4 NULL,
	release_site_id int4 NULL,
	released_at timestamp NULL,
	marked_at timestamp NULL,
	run_hatchery_fish int4 NULL,
	hatchery_fish_weight numeric NULL,
	total_wild_fish_released int4 NULL,
	total_hatchery_fish_released int4 NULL,
	total_wild_fish_dead int4 NULL,
	total_hatchery_fish_dead int4 NULL,
	CONSTRAINT release_program_id_fkey FOREIGN KEY (program_id) REFERENCES program(id),
	CONSTRAINT release_release_purpose_id_fkey FOREIGN KEY (release_purpose_id) REFERENCES release_purpose(id),
	CONSTRAINT release_release_site_id_fkey FOREIGN KEY (release_site_id) REFERENCES release_site(id),
	CONSTRAINT release_run_hatchery_fish_fkey FOREIGN KEY (run_hatchery_fish) REFERENCES run(id)
);

-- release_marks

CREATE TABLE IF NOT EXISTS release_marks (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	release_id INTEGER REFERENCES release,
	mark_type INTEGER references mark_type,
	mark_color INTEGER references mark_color,
	body_part INTEGER references body_part
);


-- release_crew definition

CREATE TABLE IF NOT EXISTS release_crew (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	personnel_id int4 NULL,
	release_id int4 NULL,
	CONSTRAINT release_crew_personnel_id_fkey FOREIGN KEY (personnel_id) REFERENCES personnel(id),
	CONSTRAINT release_crew_release_id_fkey FOREIGN KEY (release_id) REFERENCES release(id)
);

-- catch_raw definition

CREATE TABLE IF NOT EXISTS catch_raw (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	program_id int4 NULL,
	trap_visit_id int4 NULL,
	taxon_code varchar(10) NULL,
	capture_run_class int4 NULL,
	capture_run_class_method int4 NULL,
	mark_type int4 NULL,
	adipose_clipped bool NULL,
	dead bool NULL,
	life_stage int4 NULL,
	fork_length numeric NULL,
	weight numeric NULL,
	num_fish_caught int4 NULL,
	plus_count bool NULL,
	plus_count_methodology int4 NULL,
	is_random bool NULL,
	release_id int4 NULL,
	"comments" varchar(500) NULL,
	created_by int4 NULL,
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now(),
	qc_completed bool NULL,
	qc_completed_by int4 NULL,
	qc_time timestamp NULL,
	qc_comments varchar(100) NULL,
	marked_for_release bool NULL,
	CONSTRAINT catch_raw_capture_run_class_fkey FOREIGN KEY (capture_run_class) REFERENCES run(id),
	CONSTRAINT catch_raw_capture_run_class_method_fkey FOREIGN KEY (capture_run_class_method) REFERENCES run_code_method(id),
	CONSTRAINT catch_raw_created_by_fkey FOREIGN KEY (created_by) REFERENCES personnel(id),
	CONSTRAINT catch_raw_life_stage_fkey FOREIGN KEY (life_stage) REFERENCES life_stage(id),
	CONSTRAINT catch_raw_mark_type_fkey FOREIGN KEY (mark_type) REFERENCES mark_type(id),
	CONSTRAINT catch_raw_plus_count_methodology_fkey FOREIGN KEY (plus_count_methodology) REFERENCES plus_count_methodology(id),
	CONSTRAINT catch_raw_program_id_fkey FOREIGN KEY (program_id) REFERENCES program(id),
	CONSTRAINT catch_raw_qc_completed_by_fkey FOREIGN KEY (qc_completed_by) REFERENCES personnel(id),
	CONSTRAINT catch_raw_release_id_fkey FOREIGN KEY (release_id) REFERENCES release(id),
	CONSTRAINT catch_raw_taxon_code_fkey FOREIGN KEY (taxon_code) REFERENCES taxon(code),
	CONSTRAINT catch_raw_trap_visit_id_fkey FOREIGN KEY (trap_visit_id) REFERENCES trap_visit(id)
);


-- genetic_sampling_data definition

CREATE TABLE IF NOT EXISTS genetic_sampling_data (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	catch_raw_id int4 NULL,
	sample_id varchar(50) NULL,
	sample_bin varchar(50) NULL,
	mucus_swab bool NULL,
	fin_clip bool NULL,
	"comments" varchar(500) NULL,
	CONSTRAINT genetic_sampling_data_catch_raw_id_fkey FOREIGN KEY (catch_raw_id) REFERENCES catch_raw(id)
);


-- mark_applied definition

CREATE TABLE IF NOT EXISTS mark_applied (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	catch_raw_id int4 NULL,
	program_id int4 NULL,
	mark_type_id int4 NULL,
	mark_position_id int4 NULL,
	mark_color_id int4 NULL,
	mark_code varchar(25) NULL,
	"comments" varchar(500) NULL,
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now(),
	CONSTRAINT mark_applied_catch_raw_id_fkey FOREIGN KEY (catch_raw_id) REFERENCES catch_raw(id),
	CONSTRAINT mark_applied_mark_color_id_fkey FOREIGN KEY (mark_color_id) REFERENCES mark_color(id),
	CONSTRAINT mark_applied_mark_position_id_fkey FOREIGN KEY (mark_position_id) REFERENCES body_part(id),
	CONSTRAINT mark_applied_mark_type_id_fkey FOREIGN KEY (mark_type_id) REFERENCES mark_type(id),
	CONSTRAINT mark_applied_program_id_fkey FOREIGN KEY (program_id) REFERENCES program(id)
);


-- mark_applied_crew definition

CREATE TABLE IF NOT EXISTS mark_applied_crew (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	personnel int4 NULL,
	mark_applied_id int4 NULL,
	CONSTRAINT mark_applied_crew_mark_applied_id_fkey FOREIGN KEY (mark_applied_id) REFERENCES mark_applied(id),
	CONSTRAINT mark_applied_crew_personnel_fkey FOREIGN KEY (personnel) REFERENCES personnel(id)
);


-- existing_marks definition

CREATE TABLE IF NOT EXISTS existing_marks (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	program_id int4 NULL,
	release_id int4 NULL,
	mark_applied_id int4 NULL,
	catch_raw_id int4 NULL,
	fish_id varchar(10) NULL,
	mark_type_id int4 NULL,
	mark_position_id int4 NULL,
	mark_color_id int4 NULL,
	mark_code varchar(25) NULL,
	created_at timestamp NULL DEFAULT now(),
	updated_at timestamp NULL DEFAULT now(),
	CONSTRAINT existing_marks_catch_raw_id_fkey FOREIGN KEY (catch_raw_id) REFERENCES catch_raw(id),
	CONSTRAINT existing_marks_fish_id_fkey FOREIGN KEY (fish_id) REFERENCES taxon(code),
	CONSTRAINT existing_marks_mark_applied_id_fkey FOREIGN KEY (mark_applied_id) REFERENCES mark_applied(id),
	CONSTRAINT existing_marks_mark_color_id_fkey FOREIGN KEY (mark_color_id) REFERENCES mark_color(id),
	CONSTRAINT existing_marks_mark_position_id_fkey FOREIGN KEY (mark_position_id) REFERENCES body_part(id),
	CONSTRAINT existing_marks_mark_type_id_fkey FOREIGN KEY (mark_type_id) REFERENCES mark_type(id),
	CONSTRAINT existing_marks_program_id_fkey FOREIGN KEY (program_id) REFERENCES program(id),
	CONSTRAINT existing_marks_release_id_fkey FOREIGN KEY (release_id) REFERENCES release(id)
);


-- genetic_sampling_crew definition

CREATE TABLE IF NOT EXISTS genetic_sampling_crew (
	id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	personnel_id int4 NULL,
	genetic_sampling_data_id int4 NULL,
	CONSTRAINT genetic_sampling_crew_genetic_sampling_data_id_fkey FOREIGN KEY (genetic_sampling_data_id) REFERENCES genetic_sampling_data(id),
	CONSTRAINT genetic_sampling_crew_personnel_id_fkey FOREIGN KEY (personnel_id) REFERENCES personnel(id)
);