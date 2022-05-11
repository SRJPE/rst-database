CREATE TABLE projects (
    id SERIAL,
    name varchar(100), 
    main_contact_name varchar(100)
);

CREATE TABLE catch_raw (
    id SERIAL,
    project_id INTEGER REFERENCES projects,
);