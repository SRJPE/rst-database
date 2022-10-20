------ ENUMS ------

CREATE TYPE role_enum AS ENUM ('LEAD', 'NONE');
CREATE TYPE plus_count_methodology_enum as ENUM ('NONE', 'Volumetric Sampling');

------ LOOKUP TABLES ------

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

CREATE TABLE IF NOT EXISTS equipment (
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

CREATE TABLE IF NOT EXISTS unit (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    definition VARCHAR(100),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

------ MAIN TABLES ------

-- FINAL ERD VERSION
CREATE TABLE IF NOT EXISTS personnel (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    email VARCHAR(50),
    phone VARCHAR(12),
    agency_id INTEGER REFERENCES agency,
    role role_enum,
    orcid_id VARCHAR(25),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- FINAL ERD VERSION
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

-- FINAL ERD VERSION
CREATE TABLE IF NOT EXISTS program_personnel_team (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    personnel_id INTEGER REFERENCES personnel,
    program_id INTEGER REFERENCES program
);

-- FINAL ERD VERSION
CREATE TABLE IF NOT EXISTS permit_info (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    program_id INTEGER REFERENCES program,
    stream_name VARCHAR(25),
    permit_start_date DATE,
    permit_end_date DATE,
    flow_threshold NUMERIC,
    temperature_threshold NUMERIC,
    species VARCHAR(5) REFERENCES taxon (code),
    listing_unit INTEGER REFERENCES listing_unit,
    fish_life_stage INTEGER REFERENCES life_stage,
    allowed_expected_take VARCHAR(50),
    allowed_mortality_count VARCHAR(50),
    permit_file_link VARCHAR(200)
);

-- FINAL ERD VERSION
CREATE TABLE IF NOT EXISTS hatchery_info (
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

-- FINAL ERD VERSION
CREATE TABLE IF NOT EXISTS fish_measure_protocol (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    program_id INTEGER REFERENCES program,
    species VARCHAR(5) REFERENCES taxon (code),
    life_stage INTEGER REFERENCES life_stage,
    run INTEGER REFERENCES run,
    number_measured NUMERIC
);

-- FINAL ERD VERSION
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
    comments VARCHAR(500),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

-- FINAL ERD VERSION
CREATE TABLE IF NOT EXISTS trap_visit (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    program_id INTEGER REFERENCES program,
    visit_type INTEGER REFERENCES visit_type,
    trap_location_id INTEGER REFERENCES trap_locations,
    trap_visit_time_start TIMESTAMP,
    trap_visit_time_end TIMESTAMP,
    fish_processed INTEGER REFERENCES fish_processed,
    why_fish_not_processed INTEGER REFERENCES why_fish_not_processed,
    sample_gear_id INTEGER REFERENCES equipment,
    cone_depth NUMERIC,
    trap_in_thalweg BOOlEAN,
    trap_functioning INTEGER REFERENCES trap_functionality,
    why_trap_not_functioning INTEGER REFERENCES why_trap_not_functioning,
    total_revolutions INTEGER,
    rpm_at_start INTEGER,
    rpm_at_end INTEGER,
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

-- FINAL ERD VERSION
CREATE TABLE IF NOT EXISTS trap_visit_crew (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    personnel_id INTEGER REFERENCES personnel,
    trap_visit_id INTEGER REFERENCES trap_visit
);

-- FINAL ERD VERSION
CREATE TABLE IF NOT EXISTS trap_visit_environmental (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    trap_visit_id INTEGER REFERENCES trap_visit,
    measure_name VARCHAR(50),
    measure_value_numeric NUMERIC,
    measure_value_text VARCHAR(100),
    measure_unit INTEGER REFERENCES unit
);

-- FINAL ERD VERSION
CREATE TABLE IF NOT EXISTS release_site (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    trap_locations_id INTEGER REFERENCES trap_locations,
    release_site_name VARCHAR(50),
    release_site_x_coord NUMERIC,
    release_site_y_coord NUMERIC,
    release_site_coordinate_system VARCHAR(50),
    release_site_datum VARCHAR(50),
    release_site_projection VARCHAR(50)
);

-- FINAL ERD VERSION
CREATE TABLE IF NOT EXISTS release (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    program_id INTEGER REFERENCES program,
    release_purpose_id INTEGER REFERENCES release_purpose,
    release_site_id INTEGER REFERENCES release_site,
    released_at TIMESTAMP,
    marked_at TIMESTAMP,
    mark_color INTEGER REFERENCES mark_color,
    mark_type INTEGER REFERENCES mark_type,
    mark_position INTEGER REFERENCES body_part,
    run_hatchery_fish INTEGER REFERENCES run,
    hatchery_fish_weight NUMERIC,
    total_wild_fish_released INTEGER,
    total_hatchery_fish_released INTEGER,
    total_wild_fish_dead INTEGER,
    total_hatchery_fish_dead INTEGER
);

CREATE TABLE IF NOT EXISTS release_crew (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    personnel_id INTEGER REFERENCES personnel,
    release_id INTEGER REFERENCES release
);

-- FINAL ERD VERSION
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
    plus_count_methodology plus_count_methodology_enum,
    is_random BOOLEAN,
    release_id INTEGER REFERENCES release,
    comments VARCHAR(500),
    created_by INTEGER REFERENCES personnel,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    qc_completed BOOLEAN,
    qc_completed_by INTEGER REFERENCES personnel,
    qc_time TIMESTAMP,
    qc_comments VARCHAR(100)
);

-- FINAL ERD VERSION
CREATE TABLE IF NOT EXISTS genetic_sampling_data (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    catch_raw_id INTEGER REFERENCES catch_raw,
    sample_id VARCHAR(50),
    sample_bin VARCHAR(50),
    mucus_swab BOOlEAN,
    fin_clip BOOLEAN,
    comments VARCHAR(500)
);

-- FINAL ERD VERSION
CREATE TABLE IF NOT EXISTS genetic_sampling_crew (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    personnel_id INTEGER REFERENCES personnel,
    genetic_sampling_data_id INTEGER REFERENCES genetic_sampling_data
);

-- FINAL ERD VERSION
CREATE TABLE IF NOT EXISTS release_fish (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    program_id INTEGER REFERENCES program,
    release_id INTEGER REFERENCES release,
    catch_raw_id VARCHAR(25)
);

-- FINAL ERD VERSION
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

-- FINAL ERD VERSION
CREATE TABLE IF NOT EXISTS mark_applied_crew (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    personnel INTEGER REFERENCES personnel,
    mark_applied_id INTEGER REFERENCES mark_applied
);

-- FINAL ERD VERSION
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