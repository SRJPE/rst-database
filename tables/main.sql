CREATE TYPE states_enum AS ENUM ('CA', 'OR', 'WA');

--- look up tables
CREATE TABLE IF NOT EXISTS visit_type (
    code VARCHAR(50) PRIMARY KEY,
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS taxon (
    code VARCHAR(50) PRIMARY KEY,
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS agency (
    code VARCHAR(50) PRIMARY KEY,
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

--- TODO: implement these, or decide if better off as enums
CREATE TABLE IF NOT EXISTS sample_gear (
    code VARCHAR(50) PRIMARY KEY,
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS light_condition (
    code VARCHAR(50) PRIMARY KEY,
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS trap_funcionality (
    code VARCHAR(50) PRIMARY KEY,
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS fish_processed (
    code VARCHAR(50) PRIMARY KEY,
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS run (
    code VARCHAR(50) PRIMARY KEY,
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS run_code_method (
    code VARCHAR(50) PRIMARY KEY,
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);


CREATE TABLE IF NOT EXISTS life_stage (
    code VARCHAR(50) PRIMARY KEY,
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS release_purpose (
    code VARCHAR(50) PRIMARY KEY,
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS fish_origin (
    code VARCHAR(50) PRIMARY KEY,
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS mark_type (
    code VARCHAR(50) PRIMARY KEY,
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS mark_color (
    code VARCHAR(50) PRIMARY KEY,
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS body_part (
    code VARCHAR(50) PRIMARY KEY,
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

 --- main tables

CREATE TABLE IF NOT EXISTS site (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    site_name VARCHAR(50),
    data_recorder VARCHAR(50),
    data_recorder_agency VARCHAR(100) REFERENCES agency (code),
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
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS project_description (
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
    data_recorder VARCHAR(50),
    data_recorder_agency VARCHAR(100) REFERENCES agency (code),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS trap_visit (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    project_id INTEGER REFERENCES project_description, 
    visit_type_code VARCHAR(50) REFERENCES visit_type (code),
    visit_datetime_start TIMESTAMP,
    visit_datetime_stop TIMESTAMP,
    fish_processed_code VARCHAR(50) REFERENCES fish_processed (code),
    crew VARCHAR(50), --- this will be an array of FK's
    sample_gear_code VARCHAR(50) REFERENCES sample_gear (code), -- change to equipment_code
    trap_in_thalweg BOOlEAN,
    trap_functioning_code VARCHAR(50) REFERENCES trap_funcionality (code),
    revolutions_at_start INTEGER,
    revolutions_at_stop INTEGER,
    in_half_cone_configuration BOOLEAN,
    debris_volume_code VARCHAR(50),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    qc_completed BOOLEAN,
    qc_completed_at TIMESTAMP,
    comments VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS release (
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  project_id INTEGER REFERENCES project_description,
  release_purpose_id VARCHAR(50) REFERENCES release_purpose (code),
  source_of_fish_site_id INTEGER REFERENCES site,
  release_site_id INTEGER REFERENCES site,
  time_of_check TIMESTAMP,
  num_fish_dead_at_handling INTEGER,
  num_fish_dead_at_holding INTEGER,
  num_fish_released INTEGER,
  released_datetime TIMESTAMP,
  release_light_condition VARCHAR(50) REFERENCES light_condition (code),
  created_at TIMESTAMP, 
  updated_at TIMESTAMP, 
  --- add release crew columns
);

CREATE TABLE IF NOT EXISTS catch_raw (
    catch_raw_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    project_id INTEGER REFERENCES project_description,
    trap_visit_id INTEGER REFERENCES trap_visit,
    taxon_code VARCHAR(50) REFERENCES taxon (code),
    capture_run_code VARCHAR(50) REFERENCES run (code),
    capture_run_code_method VARCHAR(50) REFERENCES run_code_method (code) ,
    final_run_class VARCHAR(100) REFERENCES run (code),
    final_run_class_method VARCHAR(100) REFERENCES run_code_method (code),
    -- fish_origin_code VARCHAR(50) REFERENCES fish_origin (code),
    adipose_clipped BOOLEAN, 
    life_stage_code VARCHAR(50) REFERENCES life_stage (code),
    life_stage_code_method VARCHAR(50) REFERENCES FIX_ME,
    fork_length DECIMAL,
    total_length DECIMAL,
    weight DECIMAL,
    num_fish_caught INTEGER,
    random_sampling BOOLEAN, -- think about this
    is_dead BOOLEAN,
    release_id INTEGER,
    comments VARCHAR(500),
         VARCHAR(50), -- user that is logged in, make these changes in all tables that have these
    creation_at TIMESTAMP,
    updated_at TIMESTAMP,
    qc_completed_by VARCHAR(50), --- figure this out 
    qc_completed BOOLEAN,
    qc_time TIMESTAMP,
    qc_comments VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS release_fish (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    project_id INTEGER REFERENCES project_description,
    release_id INTEGER REFERENCES release,
    fork_length DECIMAL NOT NULL,
    weight DECIMAL,
    time_marked TIMESTAMP,
    comments VARCHAR(500),
    data_recorder VARCHAR(50),
    data_recorder_agency VARCHAR(100) REFERENCES agency (code),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    qc_done BOOLEAN,
    qc_done_at TIMESTAMP,
    qc_comments VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS mark_applied (
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  project_id INTEGER REFERENCES project_description,
  release_id INTEGER REFERENCES release,
  applied_mark_type_id VARCHAR(50) REFERENCES mark_type (code),
  applied_mark_color_id VARCHAR(50) REFERENCES mark_color (code),
  applied_mark_position_id VARCHAR(50) REFERENCES body_part (code),
  comments VARCHAR(500),
  data_recorder VARCHAR(50),
  data_recorder_agency VARCHAR(100) REFERENCES agency (code),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  qc_done BOOLEAN,
  qc_done_at TIMESTAMP,
  qc_comments VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS mark_existing (
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,   
    project_id INTEGER REFERENCES project_description,
    mark_type_code VARCHAR(50) REFERENCES mark_type (code),
    mark_color_code VARCHAR(50) REFERENCES mark_color (code),
    mark_position_id INTEGER,
    mark_existing_id INTEGER,
    mark_additional_code VARCHAR(50),
    data_recorder VARCHAR(50),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    qc_completed BOOLEAN,
    qc_completed_at TIMESTAMP,
    qc_comments VARCHAR(500)
);


CREATE TABLE trap_visit_environmental (

);


