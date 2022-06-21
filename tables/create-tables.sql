CREATE TYPE states_enum AS ENUM ('CA', 'OR', 'WA');

--- look up tables
CREATE TABLE IF NOT EXISTS visit_type (
    code VARCHAR(5) PRIMARY KEY,
    description VARCHAR(100), 
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

CREATE TABLE IF NOT EXISTS agency (
    code VARCHAR(5) PRIMARY KEY,
    description VARCHAR(100), 
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

--- TODO: implement these, or decide if better off as enums
CREATE TABLE IF NOT EXISTS equipment (
    code VARCHAR(5) PRIMARY KEY,
    description VARCHAR(100), 
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS light_condition (
    code VARCHAR(5) PRIMARY KEY,
    description VARCHAR(100), 
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS trap_funcionality (
    code VARCHAR(5) PRIMARY KEY,
    description VARCHAR(100), 
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS fish_processed (
    code VARCHAR(5) PRIMARY KEY,
    description VARCHAR(100), 
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS run (
    code VARCHAR(5) PRIMARY KEY,
    description VARCHAR(100), 
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS run_code_method (
    code VARCHAR(5) PRIMARY KEY,
    description VARCHAR(100), 
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);


CREATE TABLE IF NOT EXISTS life_stage (
    code VARCHAR(5) PRIMARY KEY,
    description VARCHAR(100), 
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS release_purpose (
    code VARCHAR(5) PRIMARY KEY,
    description VARCHAR(100), 
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS mark_type (
    code VARCHAR(5) PRIMARY KEY,
    description VARCHAR(100), 
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS mark_color (
    code VARCHAR(5) PRIMARY KEY,
    description VARCHAR(100), 
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS body_part (
    code VARCHAR(5) PRIMARY KEY,
    description VARCHAR(100), 
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS specimen_type (
    code VARCHAR(5) PRIMARY KEY,
    description VARCHAR(100), 
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS sub_sample_method (
    code VARCHAR(5) PRIMARY KEY,
    description VARCHAR(100), 
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS unit (
    code VARCHAR(5) PRIMARY KEY,
    description VARCHAR(100), 
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS cone_debris_volume (
    code VARCHAR(5) PRIMARY KEY,
    description VARCHAR(100), 
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

 --- main tables

CREATE TABLE IF NOT EXISTS users (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(25),
    last_name VARCHAR(25),
    email VARCHAR(50),
    recorder_agency VARCHAR(100) REFERENCES agency (code)
);

CREATE TABLE IF NOT EXISTS site (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    site_name VARCHAR(50),
    project_id INTEGER REFERENCES project,
    data_recorder INTEGER REFERENCES users,
    site_abbrv VARCHAR(50),
    start_operation_date DATE,
    end_operation_date DATE,
    stream_name VARCHAR(100),
    river_mile DECIMAL,
    trib_leads_to VARCHAR(50),
    state states_enum,
    raw_x_coord NUMERIC,
    raw_y_coord NUMERIC,
    raw_coord_system VARCHAR(50),
    raw_coord_method VARCHAR(50),
    raw_datum VARCHAR(50),
    raw_projection VARCHAR(50),
    x_coord NUMERIC,
    y_coord NUMERIC,
    coord_system VARCHAR(50),
    coord_method VARCHAR(50),
    datum VARCHAR(50),
    projection VARCHAR(50),
    -- georef_qa_status varchar,
    -- relative varchar,
    usgs_station_num VARCHAR(15),
    comments VARCHAR(500),
    active_id INTEGER,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS project (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    project_name VARCHAR(20),
    project_desc VARCHAR(50),
    main_contact_name VARCHAR(100),
    main_contact_agency_id INT,
    main_contact_telephone VARCHAR(50),
    main_contact_email VARCHAR(100),
    address_one VARCHAR(250),
    address_two VARCHAR(250),
    city VARCHAR(50),
    state states_enum,
    zip VARCHAR(20),
    data_contact_name VARCHAR(100),
    data_contact_telephone VARCHAR(50),
    data_contact_email VARCHAR(100),
    initial_date_year INT,
    comments VARCHAR(500),
    active_id INTEGER,
    data_recorder INTEGER REFERENCES users,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE subsite (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    site_id INTEGER REFERENCES site,
    project_id INTEGER REFERENCES project,
    subsite_name VARCHAR(100),
    subsite_description TEXT,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW()

);

CREATE TABLE IF NOT EXISTS trap_visit (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    project_id INTEGER REFERENCES project,
    subsite_id INTEGER REFERENCES subsite, 
    visit_type_code VARCHAR(5) REFERENCES visit_type (code),
    visit_datetime_start TIMESTAMP,
    visit_datetime_stop TIMESTAMP,
    fish_processed_code VARCHAR(5) REFERENCES fish_processed (code),
    equipment_code VARCHAR(5) REFERENCES equipment (code),
    trap_in_thalweg BOOlEAN,
    trap_functioning_code VARCHAR(5) REFERENCES trap_funcionality (code),
    revolutions_at_start INTEGER,
    revolutions_at_stop INTEGER,
    in_half_cone_configuration BOOLEAN,
    debris_volume_code VARCHAR(5),
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    qc_completed BOOLEAN,
    qc_completed_at TIMESTAMP,
    comments VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS trap_visit_crew (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    user_id INTEGER REFERENCES users,
    trap_visit_id INTEGER REFERENCES trap_visit
);

CREATE TABLE IF NOT EXISTS release (
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  project_id INTEGER REFERENCES project,
  release_purpose_id VARCHAR(50) REFERENCES release_purpose (code),
  source_of_fish_site_id INTEGER REFERENCES site,
  release_site_id INTEGER REFERENCES site,
  time_of_check TIMESTAMP,
  num_fish_dead_at_handling INTEGER,
  num_fish_dead_at_holding INTEGER,
  num_fish_released INTEGER,
  released_datetime TIMESTAMP,
  release_light_condition VARCHAR(50) REFERENCES light_condition (code),
  created_at TIMESTAMP DEFAULT NOW(), 
  updated_at TIMESTAMP DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS release_crew (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    user_id INTEGER REFERENCES users,
    release_id INTEGER REFERENCES release
);

CREATE TABLE IF NOT EXISTS catch_raw (
    catch_raw_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    project_id INTEGER REFERENCES project,
    trap_visit_id INTEGER REFERENCES trap_visit,
    taxon_code VARCHAR(5) REFERENCES taxon (code),
    capture_run_code VARCHAR(5) REFERENCES run (code),
    capture_run_code_method VARCHAR(50) REFERENCES run_code_method (code) ,
    final_run_class VARCHAR(100) REFERENCES run (code),
    final_run_class_method VARCHAR(100) REFERENCES run_code_method (code),
    adipose_clipped BOOLEAN, 
    life_stage_code VARCHAR(5) REFERENCES life_stage (code),
    -- life_stage_code_method VARCHAR(50) REFERENCES #####,   -- TODO: Fix this
    fork_length DECIMAL,
    total_length DECIMAL,
    weight DECIMAL,
    num_fish_caught INTEGER,
    random_sampling BOOLEAN, -- think about this
    is_dead BOOLEAN,
    release_id INTEGER,
    comments VARCHAR(500),
    data_recorder INTEGER REFERENCES users,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    qc_completed_by INTEGER REFERENCES users,
    qc_completed BOOLEAN,
    qc_time TIMESTAMP,
    qc_comments VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS release_fish (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    project_id INTEGER REFERENCES project,
    release_id INTEGER REFERENCES release,
    fork_length DECIMAL NOT NULL,
    weight DECIMAL,
    time_marked TIMESTAMP,
    comments VARCHAR(500),
    data_recorder INTEGER REFERENCES users,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    qc_done BOOLEAN,
    qc_done_at TIMESTAMP,
    qc_comments VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS mark_applied (
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  project_id INTEGER REFERENCES project,
  release_id INTEGER REFERENCES release,
  applied_mark_type_id VARCHAR(50) REFERENCES mark_type (code),
  applied_mark_color_id VARCHAR(50) REFERENCES mark_color (code),
  applied_mark_position_id VARCHAR(50) REFERENCES body_part (code),
  comments VARCHAR(500),
  data_recorder INTEGER REFERENCES users,
  created_at TIMESTAMP DEFAULT NOW(),
  updated_at TIMESTAMP DEFAULT NOW(),
  qc_done BOOLEAN,
  qc_done_at TIMESTAMP,
  qc_comments VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS mark_existing (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,   
    project_id INTEGER REFERENCES project,
    mark_type_code VARCHAR(5) REFERENCES mark_type (code),
    mark_color_code VARCHAR(5) REFERENCES mark_color (code),
    mark_position_id INTEGER,
    mark_existing_id INTEGER,
    mark_additional_code VARCHAR(5),
    data_recorder INTEGER REFERENCES users,
    created_at TIMESTAMP DEFAULT NOW(),
    updated_at TIMESTAMP DEFAULT NOW(),
    qc_completed BOOLEAN,
    qc_completed_at TIMESTAMP,
    qc_comments VARCHAR(500)
);

CREATE TABLE trap_visit_environmental (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    trap_visit_id INTEGER REFERENCES trap_visit,
    measure_name VARCHAR(25),
    measure_value_numeric DECIMAL,
    measure_value_text VARCHAR(25),
    measure_unit VARCHAR(5) REFERENCES unit (code)
);



