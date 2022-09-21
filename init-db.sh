# load env vars for db creds
source env.sh

# drop tables
psql -f tables/drop-tables.sql

# create tables
psql -f tables/create-tables.sql

# seed lookups
psql -f  seed_data/seed_data.sql