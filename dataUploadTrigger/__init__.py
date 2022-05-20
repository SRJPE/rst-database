import logging
import pandas as pd
from io import StringIO
import sqlalchemy

import azure.functions as func

# define connection to database

def main(myblob: func.InputStream):
    logging.info(f"Python blob trigger function processed blob \n"
                 f"Name: {myblob.name}\n"
                 f"Blob Size: {myblob.length} bytes\n"
                 f"Blob URI: {myblob.uri}\n"
                 f"Blob dirs: {dir(myblob)}")

    blob_string = str(myblob.read(),'utf-8')

    data = StringIO(blob_string) 

    df=pd.read_csv(data)

    logging.info(f"{df}\n")
