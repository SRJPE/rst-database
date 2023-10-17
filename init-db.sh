# seed lookups
psql -h $POSTGRES_HOST -d $POSTGRES_DB -p $POSTGRES_PASSWORD -U $POSTGRES_USER -p $POSTGRES_PORT -f  app/seed_azure.sql