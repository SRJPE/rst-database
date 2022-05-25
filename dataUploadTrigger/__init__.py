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
    data = StringIO(blob_string) 
    df=pd.read_csv(data)

    engine = create_rst_engine()

    # detect what kind of data this is and where it should go in the db

    

    logging.info(f"{df}\n")



metadata_obj = MetaData()
metadata_obj.reflect(bind=engine)
visit_type = metadata_obj.tables['visit_type']
