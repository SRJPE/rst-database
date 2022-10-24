import pandas as pd
import os

dirname = os.path.dirname(__file__)
input_path = os.path.join(dirname, './excel/CAMP tables .xlsx')
export_path = os.path.join(dirname, './data')

input_path = '/Users/hunterherrera/Desktop/Code/Development/JPE/rst-database/seed_data/excel/CAMP Tables - Final Draft.xlsx'
export_path = '/Users/hunterherrera/Desktop/Code/Development/JPE/rst-database/seed_data/data'

def create_lookup_csvs():
  columns_to_remove = ['Code']

  xl = pd.ExcelFile(input_path)
  sheet_names = xl.sheet_names

  # for each lookup table sheet in excel file create csv
  for name in sheet_names:
    df = pd.read_excel(input_path, sheet_name=name)
    columns = list(df.columns)
    drop_columns = []

    for column in columns:
        if any(x in column for x in columns_to_remove): drop_columns.append(column)

    df.drop(columns=drop_columns, inplace=True)
    df.to_csv(export_path + "/" + "{}.csv".format(name), encoding='utf-8', index=False)

create_lookup_csvs()