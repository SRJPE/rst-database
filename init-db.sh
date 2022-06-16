# load env vars for db creds
source env.sh 

# drop tables
psql -f tables/drop-tables.sql 

# create tables
psql -f tables/create-tables.sql

# seed lookups
# psql -h $HOST -d $DB -p $PASSWORD -U $USERNAME -p $PORT -f  seedData/seed_data.sql
