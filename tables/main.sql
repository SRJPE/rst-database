CREATE TYPE states AS ENUM ('CA', 'OR', 'WA');

--- look up tables
CREATE TABLE IF NOT EXISTS visit_type (
    id SERIAL, 
    code VARCHAR(50),
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS taxon (
    id SERIAL, 
    code VARCHAR(50),
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS agency (
    id SERIAL, 
    code VARCHAR(50),
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

--- TODO: implement these, or decide if better off as enums
CREATE TABLE IF NOT EXISTS sample_gear (
    id SERIAL, 
    code VARCHAR(50),
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS light_condition (
    id SERIAL, 
    code VARCHAR(50),
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS trap_funcionality (
    id SERIAL, 
    code VARCHAR(50),
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS fish_processed (
    id SERIAL, 
    code VARCHAR(50),
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS run (
    id SERIAL, 
    code VARCHAR(50),
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS run_code_method (
    id SERIAL, 
    code VARCHAR(50),
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);


CREATE TABLE IF NOT EXISTS life_stage (
    id SERIAL, 
    code VARCHAR(50),
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS release_purpose (
    id SERIAL, 
    code VARCHAR(50),
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS fish_origin (
    id SERIAL, 
    code VARCHAR(50),
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS mark_type (
    id SERIAL, 
    code VARCHAR(50),
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS mark_color (
    id SERIAL, 
    code VARCHAR(50),
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS body_part (
    id SERIAL, 
    code VARCHAR(50),
    description VARCHAR(50), 
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

 --- main tables

CREATE TABLE IF NOT EXISTS site (
    id SERIAL,
    site_name VARCHAR(50),
    data_recorder VARCHAR(50),
    data_recorder_agency VARCHAR(50) REFERENCES agency (code),
    site_abbrv VARCHAR(50),
    -- site_id int,
    start_operation_date DATE, -- is this correct?
    end_operation_date DATE, -- is this correct?
    stream_name VARCHAR(100),
    river_mile DECIMAL,
    -- trib_to varchar,
    state states,
    coord GEOMETRY(POINT, 4326),
    -- src_x_coord <type>,
    -- src_y_coord <type>,
    -- coordinate_system VARCHAR(50),
    -- ll_source varchar,
    -- src_datum varchar,
    -- src_projection varchar,
    -- x_coord <type>,
    -- y_coord <type>,
    -- coord_systm <type>,
    -- datum varchar,
    -- projection varchar,
    -- georef_qa_status varchar,
    -- realtive varchar,
    -- usgs_station_num int,
    -- discharge_url varchar,
    comments VARCHAR(500),
    active_id INTEGER,
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

 
CREATE TABLE IF NOT EXISTS projects (
    id SERIAL,
    name VARCHAR(100), 
    contact_name VARCHAR(100), 
    contact_agency VARCHAR(50),
    contact_telephone VARCHAR(50),
    contact_email VARCHAR(100),
    contact_address VARCHAR(250), 
    contact_city VARCHAR(50),
    contact_state states_enum, --- create this
    contact_zip varhcar(20),
    data_contact_name VARCHAR(100), 
    data_contact_telephone VARCHAR(50),
    data_contact_email VARCHAR(100),
    initial_data_year INT, 
    comments VARCHAR(500),
    active_id VARCHAR(10),
    data_recorder VARCHAR(20),
    data_recorder_agency VARCHAR(100) REFERENCES agency (code),
    created_at TIMESTAMP,
    updated_at TIMESTAMP 
);

CREATE TABLE IF NOT EXISTS project_description (
    project_name VARCHAR(20),
    project_desc VARCHAR(50),
    main_contact_name VARCHAR(20),
    main_contact_agency_id INT,
    main_contact_telephone VARCHAR(50),
    main_contact_email VARCHAR(100),
    address_one VARCHAR(250),
    address_two VARCHAR(250),
    city VARCHAR(100),
    state states,
    zip VARCHAR(20),
    data_contact_name VARCHAR(20),
    data_contact_telephone VARCHAR(50),
    data_contact_email VARCHAR(100),
    initial_date_year INT,
    comments VARCHAR(500),
    active_id INT,
    data_recorder VARCHAR(20),
    data_recorder_agency VARCHAR(100) REFERENCES agency (code),
    created_at TIMESTAMP,
    updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS trap_visit (
    id SERIAL,
    project_id INTEGER REFERENCES project, 
    visit_type_code VARCHAR(100) REFERENCES visit_type (code),
    fish_processed_code VARCHAR(100) REFERENCES fish_processed (code),
    crew_id VARCHAR(50),
    sample_gear_code VARCHAR(100) REFERENCES sample_gear (code),
    trap_in_thalweg BOOlEAN,
    trap_functioning_code VARCHAR(100) REFERENCES trap_funcionality (code),
    counter_at_end INTEGER,
    rpm_revolution_at_start INTEGER,
    rpm_revolution_at_end INTEGER,
    in_half_cone_configuration BOOLEAN,
    debris_volume_code VARCHAR(100),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    qc_completed BOOLEAN,
    qc_completed_at TIMESTAMP,
    comments VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS release (
  id SERIAL,
  project_id REFERENCES project,
  release_purpose_code VARCHAR(50) REFERENCES release_purpose (code),
  source_of_fish_site_id VARHCAR(50) REFERENCES site,
  release_site_id VARCHAR(50) REFERENCES site,
  time_of_check TIMESTAMP,
  num_fish_dead_at_handling INTEGER,
  num_fish_dead_at_holding INTEGER,
  num_fish_released INTEGER,
  released_at TIMESTAMP,
  release_light_condition VARCHAR(50) REFERENCES light_condition
  created_at TIMESTAMP, 
  updated_at TIMESTAMP
);

CREATE TABLE IF NOT EXISTS catch_raw (
    catch_raw_id SERIAL,
    project_id INTEGER REFERENCES projects,
    trap_visit_id INTEGER REFERENCES trap_visit,
    taxon_code VARCHAR(100) REFERENCES taxon (code),
    capture_run_code VARCHAR(100) REFERENCES run (code),
    capture_run_code_method VARCHAR(100) REFERENCES run_code_method (code) ,
    final_run_class VARCHAR(100) REFERENCES run (code),
    final_run_class_method VARCHAR(100) REFERENCES run_code_method (code),
    fish_origin_code VARCHAR(100) REFERENCES fish_origin (code),
    life_stage VARCHAR(50) REFERENCES life_stage (code),
    fork_length DECIMAL,
    total_length DECIMAL,
    weight DECIMAL,
    num_fish_caught INTEGER,
    is_random BOOLEAN,
    release_id INTEGER,
    comments VARCHAR(500),
    data_sheet_number INTEGER,
    data_recorder VARCHAR(50),
    data_recorder_agency VARCHAR(100) REFERENCES agency (code),
    creation_at TIMESTAMP,
    updated_at TIMESTAMP,
    qc_completed BOOLEAN,
    qc_time TIMESTAMP,
    qc_comments VARCHAR(100)
);

CREATE TABLE IF NOT EXISTS release_fish (
    id SERIAL,
    project_id VARCHAR(100) REFERENCES projects,
    release_id VARCHAR(100) REFERENCES release,
    fork_length DECIMAL,
    weight DECIMAL,
    time_marked TIMESTAMP,
    comments VARCHAR(100),
    data_sheet_number INTEGER,
    data_recorder VARCHAR(50),
    data_recorder_agency VARCHAR(100) REFERENCES agency (code),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    qc_done BOOLEAN,
    qc_done_at TIMESTAMP,
    qc_comments VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS mark_applied (
  id SERIAL,
  project_id INTEGER REFERENCES project,
  release_id INTEGER REFERENCES release,
  applied_mark_type VARCHAR(50) REFERENCES mark_type (code),
  applied_mark_color VARCHAR(50) REFERENCES mark_color (code),
  applied_mark_pos_id VARCHAR(50) REFERENCES body_part (code),
  comments VARCHAR(500),
  data_recorder VARCHAR(50),
  data_recorder_agency_id VARCHAR(50) REFERENCES agency (code),
  created_at TIMESTAMP,
  updated_at TIMESTAMP,
  qc_done BOOLEAN,
  qc_done_at TIMESTAMP,
  qc_comments VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS mark_existing (
    id SERIAL,   
    project_id INTEGER REFERENCES project,
    mark_type_code VARCHAR(50) REFERENCES mark_type (code),
    mark_color_code VARCHAR(50) REFERENCES mark_color (code),
    mark_position_id INT,
    mark_existing_id INT,
    mark_additional_code VARCHAR(50),
    data_recorder VARCHAR(50),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    qc_completed BOOLEAN,
    qc_completed_at TIMESTAMP,
    qc_comments VARCHAR(500),
);