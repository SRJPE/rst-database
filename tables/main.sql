--- look up tables
CREATE TABLE IF NOT EXISTS visit_type (
    id SERIAL, 
    code VARCHAR(50),
    description VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS agency (
    id SERIAL, 
    code varchar(50),
    description VARCHAR(50)
);

--- TODO: implement these, or decide if better off as enums
CREATE TABLE IF NOT EXISTS sample_gear ();
CREATE TABLE IF NOT EXISTS light_condition ();
CREATE TABLE IF NOT EXISTS trap_funcionality ();
CREATE TABLE IF NOT EXISTS fish_processed ();
CREATE TABLE IF NOT EXISTS run ();
CREATE TABLE IF NOT EXISTS life_stage ();
CREATE TABLE IF NOT EXISTS release_purpose ();


 --- main tables
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
    data_recorder_agency_id VARCHAR(20),
    created_at TIMESTAMP,
    updated_at TIMESTAMP 
);

CREATE TABLE IF NOT EXISTS trap_visit (
    id SERIAL,
    project_id INTEGER REFERENCES project, 
    visit_type_code INTEGER REFERENCES visit_type (code),

);

CREATE TABLE IF NOT EXISTS catch_raw (
    id SERIAL,
    project_id INTEGER REFERENCES projects,
    trap_visit_id INTEGER REFERENCES trap_visit
);