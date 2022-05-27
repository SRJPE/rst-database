import logging
import pandas as pd
from io import StringIO
from sqlalchemy import create_engine, Table, MetaData
from dotenv import load_dotenv
import os


import azure.functions as func

# define connection to database
load_dotenv()

# TODO conver to *kwargs?
def create_rst_engine(host=os.getenv("DB_HOST"), username=os.getenv("DB_USERNAME"), 
                    password=os.getenv("DB_PASSWORD"), 
                    dbname=os.getenv("DB_NAME"), port=os.getenv("DB_PORT")):
    conn_string = "postgresql://{}:{}@{}:{}/{}".format(
        username, 
        password, 
        host, 
        port,
        dbname
    )
    try:
        engine = create_engine(conn_string)
        return engine
    except Exception as e:
        print(e)

def main(myblob: func.InputStream):

    logging.info(f"Python blob trigger function processed blob \n"
                 f"Name: {myblob.name}\n"
                 f"Blob Size: {myblob.length} bytes\n"
                 f"Blob URI: {myblob.uri}\n"
                 f"Blob dirs: {dir(myblob)}")

    blob_string = str(myblob.read(),'utf-8')

    # read in the data 
    file_name = os.path.basename(myblob.name)
    table_name = file_name.replace('.csv', '')
    data = StringIO(blob_string) 
    df=pd.read_csv(data)
    dict=df.to_dict('index')
    payload=[]
    for key in dict:
        payload.append(dict[key])

    engine = create_rst_engine()

    with engine.connect() as conn:
        metadata_obj = MetaData()
        metadata_obj.reflect(bind=conn)
        visit_type = metadata_obj.tables['visit_type']
        conn.execute(visit_type.insert(), payload)
        # table = metadata_obj.tables[table_name]
        # conn.execute(table.insert(), payload)