# Rotary Screw Trap Database

## Table of Contents

1.  **[Objective]()**
2.  **[Dependencies](#dependencies)**
3.  **[Environmental Variables](#environment-variables)**
4.  **[Usage](#usage)**

## Objective

This repository stores the SQL files and Docker settings responsible for creating the Rotary Screwtrap Database.

This repository also allows for creating a local PostgreSQL database using Docker.

The production and staging versions are deployed as an _Azure Database for PostgreSQL flexible server_.

## Dependencies

Please ensure these software are installed on your computer:

- PostgreSQL
- Docker and Docker Desktop

## Environment Variables

Create a .env file with the following environment variables:

- `POSTGRES_HOST` set equal to `'postgres'`
- `POSTGRES_DB`, `POSTGRES_USER` and `POSTGRES_PASSWORD` can be any value you'd like
- `POSTGRES_PORT` set equal to `5432`
- `POSTGRES_SSL` set equal to `FALSE`
- `JPE_BIND_DIR` set equal to the path of the working directory. This can be found by running `pwd` in terminal.
- `NODE_ENV` will be `development` for local database setup.

## Usage

- Using your Command Line Interface, at the root of the directory, and with Docker Desktop running, create Docker instance by running the command: `docker-compose up --build -d` . This will create a Docker Container with two images, `rst-database_postgres` and `rst-database_migration`

![screenshot of rst-database Docker container and images](https://rstmarkdownimages.blob.core.windows.net/markdown-images/Screenshot%202024-06-17%20at%209.32.41%20AM.png)

- The image ending in `_postgres` is running the PostgreSQL database instance, and the `_migration` image will be used for running seeding and migrations.

### ** Local Database**

Following the instantiation of the database, it will require running the SQL statements to create all tables and seed with values. To do that for the local database.

1.  With Docker Desktop, open the CLI for the `rst-database_migration` image.
2.  This will open a Command Line Interface window.
3.  Within that window, run `npm run migrate` . This will run all the neccessary table creation SQL scripts,
4.  When that finishes, run `npm run runseed`, which will insert all neccessary lookup values
5.  The database is now running and contains the initial tables and values neccessary to interact with the client and server

### ** Cloud Database**

1. For hosting the database within a cloud service, follow the instructions provided by the cloud service provider (Azure, AWS, GCP, etc)
2. Once that database has been provisioned, update the `.env` files with the appropriate values created for the cloud database, as well as updating the `NODE_ENV` variable to `staging` or `development` .
3. From here, you can either create a Docker container connected to the cloud database and run the same migration commands as described above, or directly connect to the database instance and run commands within the PSQL instance:

The Following commands can be run within a PSQL instance

- Create tables with `\i tables/create_tables.sql`

- Drop tables with `\i tables/drop_tables.sql`

- Seed Cloud DB with `\i seed_data/seed_data_cloud.sql`

## Setting up the User Interface and Server

Please visit the respective repositories for the User Interface and the Server to access setup instructions for those portions of the application.

[User Interface (Tablet Application)](https://github.com/SRJPE/rst-pilot-app-client)

[Backend Server](https://github.com/SRJPE/jpe-app-server)
