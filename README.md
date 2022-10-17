# Rotary Screw Trap Database

## Table of Contents

1. **[Objective]()**
2.  **[Usage](#usage)**
3.  **[Dependencies](#dependencies)**
4.  **[Additional Resources](#additional)**


## Objective
This repository stores the SQL files and Docker settings responsible for creating the Rotary Screwtrap Database.
Currently deployed as an *Azure Database for PostgreSQL flexible server*.

## Environment Variables
- Create a .env file with a `JPE_BIND_DIR` variable set equal to the path of this directory.
This can be found by running `pwd` in terminal


## Usage
- Create Docker instance with `docker-compose up --build -d`
- Connect to local docker instance with `psql -h localhost -U postgres -d postgres`
- Connect to Azure with `psql -h rstdb.postgres.database.azure.com -U postgres -d postgres`
- Create tables with `\i tables/create_tables.sql`
- Drop tables with `\i tables/drop_tables.sql`
- Seed docker container with `\i seed_data/seed_data.sql`
- Seed Azure DB with `\i seed_data/seed_azure.sql`


## Dependencies
- postgresql
- python
- pandas
- openpyxl



## Additional
- 🚧 TBA 🚧