from sqlalchemy import create_engine
from sqlalchemy import MetaData
from sqlalchemy import Table
from sqlalchemy import text

metadata = MetaData()
engine = create_engine('postgresql://postgres:postgres@localhost:5432/rst_db')

with engine.connect() as con:
    with open("tables/main.sql") as f:
        query = text(f.read())
        con.execute(query)


    