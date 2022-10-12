CREATE TYPE role_enum AS ENUM ('LEAD', 'NONE');

CREATE TYPE states_enum AS ENUM ('CA', 'OR', 'WA');

--- look up tables
CREATE TABLE IF NOT EXISTS visit_type (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    definition VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS taxon (
    code VARCHAR(10) PRIMARY KEY,
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
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS listing_unit (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    definition VARCHAR(100),
    associated_species VARCHAR(20),
    run VARCHAR(20),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS frequency (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    definition VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS why_trap_not_functioning (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    definition VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS why_fish_not_processed (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    definition VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS agency (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    definition VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

--- TODO: implement these, or decide if better off as enums
CREATE TABLE IF NOT EXISTS equipment (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    definition VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS light_condition (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    definition VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS trap_functionality (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    definition VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS fish_processed (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    definition VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS run (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    definition VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS run_code_method (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    definition VARCHAR(100),
    description VARCHAR(200),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS life_stage (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    definition VARCHAR(100),
    description VARCHAR(200),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS release_purpose (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    definition VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS mark_type (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    definition VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS mark_color (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    definition VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS body_part (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    definition VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS specimen_type (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    definition VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS sub_sample_method (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    definition VARCHAR(100),
    description VARCHAR(200),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS unit (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    definition VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS cone_debris_volume (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    definition VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

--- main tables
CREATE TABLE IF NOT EXISTS personnel (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    email VARCHAR(50),
    phone VARCHAR(8),
    agency_id INTEGER REFERENCES agency,
    role role_enum,
    orcid_id VARCHAR(8),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS program (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    program_name VARCHAR(25),
    stream_name VARCHAR(25),
    personnel_lead INTEGER REFERENCES personnel,
    funding_agency INTEGER REFERENCES agency,
    efficiency_protocols_document_link VARCHAR(200),
    trapping_protocols_document_link VARCHAR(200),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS program_personnel_team (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    personnel_id INTEGER REFERENCES personnel,
    program_id INTEGER REFERENCES program
);

CREATE TABLE IF NOT EXISTS permit (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    program_id INTEGER REFERENCES program,
    stream_name VARCHAR(25),
    permit_start_date DATE,
    permit_end_date DATE,
    flow_threshold NUMERIC,
    temperature_threshold NUMERIC,
    species VARCHAR(5) REFERENCES taxon (code),
    listing_unit INTEGER REFERENCES listing_unit,
    fish_lifestage VARCHAR(25),
    allowed_expected_take VARCHAR(50),
    allowed_mortality_count VARCHAR(50),
    permit_file_link VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS hatchery (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    hatchery_name VARCHAR(25),
    stream_name VARCHAR(25),
    agreement_id VARCHAR(25),
    program_id INTEGER REFERENCES program,
    aggrement_start_date DATE,
    aggrement_end_date DATE,
    renewal_date DATE,
    frequency_of_fish_collection INTEGER REFERENCES frequency,
    quantity_of_fish NUMERIC,
    hatchery_file_link VARCHAR(200)
);

CREATE TABLE IF NOT EXISTS fish_measure_protocol (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    program_id INTEGER REFERENCES program,
    species VARCHAR(5) REFERENCES taxon (code),
    life_stage INTEGER REFERENCES life_stage,
    run INTEGER REFERENCES run,
    number_measured NUMERIC
);

CREATE TABLE IF NOT EXISTS trap_locations (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    trap_name VARCHAR(50),
    program_id INTEGER REFERENCES program,
    data_recorder_id INTEGER REFERENCES personnel,
    data_recorder_agency_id INTEGER REFERENCES agency,
    site_name VARCHAR(50),
    cone_size_ft NUMERIC,
    x_coord NUMERIC,
    y_coord NUMERIC,
    coordinate_system VARCHAR(100),
    projection VARCHAR(100),
    datum VARCHAR(100),
    gage_number NUMERIC,
    gage_agency INTEGER REFERENCES agency,
    release_site_name VARCHAR(50),
    release_site_id VARCHAR(50),
    release_site_x_coord NUMERIC,
    release_site_y_coord NUMERIC,
    release_site_coordinate_system VARCHAR(100),
    release_site_datum VARCHAR(100),
    release_site_projection VARCHAR(100),
    comments VARCHAR(500),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS trap_visit (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    program_id INTEGER REFERENCES program,
    visit_type INTEGER REFERENCES visit_type,
    trap_location_id INTEGER REFERENCES trap_locations,
    trap_visit_time_start TIMESTAMP,
    trap_visit_time_end TIMESTAMP,
    fish_processed INTEGER REFERENCES fish_processed,
    equipment INTEGER REFERENCES equipment,
    trap_in_thalweg BOOlEAN,
    trap_functioning INTEGER REFERENCES trap_functionality,
    status_at_end INTEGER REFERENCES trap_functionality,
    total_revolutions INTEGER,
    rpm_at_start INTEGER,
    rpm_at_stop INTEGER,
    cone_depth NUMERIC,
    in_half_cone_configuration BOOLEAN,
    debris_volume_liters INTEGER,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    qc_completed BOOLEAN,
    qc_completed_at TIMESTAMP,
    comments VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS trap_coordinates (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    trap_visit_id INTEGER REFERENCES trap_visit,
    trap_locations_id INTEGER REFERENCES trap_locations,
    x_coord NUMERIC,
    y_coord NUMERIC,
    datum VARCHAR(100),
    projection VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS trap_visit_crew (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    personnel_id INTEGER REFERENCES personnel,
    trap_visit_id INTEGER REFERENCES trap_visit
);

CREATE TABLE IF NOT EXISTS release (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    program_id INTEGER REFERENCES program,
    release_purpose_id INTEGER REFERENCES release_purpose,
    source_of_fish_site_id INTEGER REFERENCES trap_locations,
    release_site_id INTEGER REFERENCES trap_locations,
    time_of_check TIMESTAMP,
    num_fish_dead_at_handling INTEGER,
    num_fish_dead_at_holding INTEGER,
    num_fish_released INTEGER,
    released_datetime TIMESTAMP,
    release_light_condition INTEGER REFERENCES light_condition,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS release_crew (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    user_id INTEGER REFERENCES personnel,
    release_id INTEGER REFERENCES release
);

CREATE TABLE IF NOT EXISTS catch_raw (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    program_id INTEGER REFERENCES program,
    trap_visit_id INTEGER REFERENCES trap_visit,
    taxon_code VARCHAR(5) REFERENCES taxon (code),
    capture_run_class INTEGER REFERENCES run,
    capture_run_class_method INTEGER REFERENCES run_code_method,
    mark_type INTEGER REFERENCES mark_type,
    adipose_clipped BOOLEAN,
    life_stage INTEGER REFERENCES life_stage,
    fork_length DECIMAL,
    weight DECIMAL,
    num_fish_caught INTEGER,
    plus_count BOOLEAN,
    is_random BOOLEAN,
    release_id INTEGER,
    comments VARCHAR(500),
    data_sheet_number INTEGER,
    data_recorder INTEGER REFERENCES personnel,
    data_recorder_agency INTEGER REFERENCES agency,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    qc_completed BOOLEAN,
    qc_completed_by INTEGER REFERENCES personnel,
    qc_time TIMESTAMP,
    qc_comments VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS genetic_sampling_data (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    catch_raw_id INTEGER REFERENCES catch_raw,
    sample_id VARCHAR(20),
    sample_bin VARCHAR(20),
    mucus_swab BOOlEAN,
    fin_clip BOOLEAN,
    comments VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS genetic_sampling_crew (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    personnel_id INTEGER REFERENCES personnel,
    genetic_sampling_data_id INTEGER REFERENCES genetic_sampling_data
);


CREATE TABLE IF NOT EXISTS release_fish (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    program_id INTEGER REFERENCES program,
    release_id INTEGER REFERENCES release,
    catch_raw_id VARCHAR(25),
    fork_length DECIMAL NOT NULL,
    weight DECIMAL,
    time_marked TIMESTAMP,
    comments VARCHAR(500),
    data_recorder INTEGER REFERENCES personnel,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    qc_done BOOLEAN,
    qc_done_at TIMESTAMP,
    qc_comments VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS mark_applied (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    catch_raw_id INTEGER REFERENCES catch_raw,
    program_id INTEGER REFERENCES program,
    mark_type_id INTEGER REFERENCES mark_type,
    mark_position_id INTEGER REFERENCES body_part,
    mark_color_id INTEGER REFERENCES mark_color,
    mark_code VARCHAR(25),
    comments VARCHAR(500),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS mark_applied_crew (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    personnel INTEGER REFERENCES personnel,
    mark_applied_id INTEGER REFERENCES mark_applied
);

CREATE TABLE IF NOT EXISTS existing_marks (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    program_id INTEGER REFERENCES program,
    release_id INTEGER REFERENCES release,
    mark_applied_id INTEGER REFERENCES mark_applied,
    catch_raw_id INTEGER REFERENCES catch_raw,
    fish_id VARCHAR(5) REFERENCES taxon (code),
    mark_type_id INTEGER REFERENCES mark_type,
    mark_position_id INTEGER REFERENCES body_part,
    mark_color_id INTEGER REFERENCES mark_color,
    mark_code VARCHAR(25),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS trap_visit_environmental (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    trap_visit_id INTEGER REFERENCES trap_visit,
    measure_name VARCHAR(25),
    measure_value_numeric DECIMAL,
    measure_value_text VARCHAR(25),
    measure_unit INTEGER REFERENCES unit
);