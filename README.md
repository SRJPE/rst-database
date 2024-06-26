# Rotary Screw Trap Database

## Table of Contents

1. **[Objective]()**
2.  **[Usage](#usage)**
3.  **[Dependencies](#dependencies)**


## Objective
This repository stores the SQL files and Docker settings responsible for creating the Rotary Screwtrap Database.
Currently deployed as an *Azure Database for PostgreSQL flexible server*.

## Environment Variables
Create a .env file with the following environment variables: 
- `JPE_BIND_DIR` set equal to the path of the working directory. This can be found by running `pwd` in terminal.
- `POSTGRES_DB` set equal to rstdb.  
  
  
And add the following but please reach out for the values
- `POSTGRES_USER`
- `POSTGRES_PASSWORD`


## Usage
- Create Docker instance with `docker-compose up --build -d`
- Connect to local docker instance with `psql -h localhost -U postgres -d rstdb`
- Connect to Azure with `psql -h rst-db.postgres.database.azure.com -U postgres -d postgres`. 
  
    

The Following commands can be run within a PSQL instance
- Create tables with `\i tables/create_tables.sql`
- Drop tables with `\i tables/drop_tables.sql`
- Seed docker container with `\i seed_data/seed_data.sql`
- Seed Azure DB with `\i seed_data/seed_azure.sql`


## Dependencies
- postgresql
- python
- pandas
- openpyxl
