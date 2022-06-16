# load env vars for db creds
source env.sh 

# drop tables
psql -h $DB_HOST -d $DB_NAME -U $DB_USERNAME -p $DB_PORT -f tables/drop_tables.sql 

# create tables
psql -h $DB_HOST -d $DB_NAME -U $DB_USERNAME -p $DB_PORT -f  tables/create-tables.sql

# seed lookups
# psql -h $HOST -d $DB -p $PASSWORD -U $USERNAME -p $PORT -f  seedData/seed_data.sql
