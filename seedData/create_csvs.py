import pandas as pd

input_path = r'/Users/hunterherrera/Desktop/Code/Development/JPE/rst-database/seedData/excel/CAMP tables .xlsx'
export_path = r'/Users/hunterherrera/Desktop/Code/Development/JPE/rst-database/seedData/data'

def create_lookup_csvs():
  tables_to_remove = ['luFishOrigin']
  columns_to_remove = ['Improvement', 'Unnamed']
  defintion_column_target = 'Definition'
  improvements_column_target = 'Improvement'
  additional_info_target = '3'

  xl = pd.ExcelFile(input_path)
  sheet_names = xl.sheet_names
  for table in tables_to_remove:
    sheet_names.remove(table)

  # for each lookup table sheet in excel file create csv
  for name in sheet_names:
    if 'lu' in name:
      excel = pd.read_excel(input_path, sheet_name=name)
      df = pd.DataFrame(excel)
      columns = list(df.columns)
      drop_columns = []   # list to dynamically find columns to drop (ex. 'Proposed Improvement', 'Proposed Improvements', 'Proposed Improvements ')
      defintion_column = ''
      proposed_improvements_column = ''
      additional_info_column = ''

      # iterate through columns of df and flag for use / removal
      for column in columns:
        if defintion_column_target in column:
          defintion_column = column
          continue
        if any(x in column for x in columns_to_remove):
          drop_columns.append(column)
          if improvements_column_target in column:
            proposed_improvements_column = column
            continue
          if additional_info_target in column:
            additional_info_column = column

      # iterate through rows and manipulate data if columns exist
      for row_index in df.index:
        if additional_info_column != '':
          additional_info_value = df.loc[row_index, additional_info_column]
          if type(additional_info_value) == str:
            if 'REMOVE' in additional_info_value:
              df.drop(index=[row_index], inplace=True)
              continue
        if proposed_improvements_column != '' and defintion_column != '':
          improvement_value = df.loc[row_index, proposed_improvements_column]
          if type(improvement_value) == str:
            if 'REMOVE' in improvement_value:
              df.drop(index=[row_index], inplace=True)
              continue
          # TODO: revise condition below to check for if not NaN values
          if type(improvement_value) != float:
            df.loc[row_index, defintion_column] = improvement_value

      # drop unneeded columns & export csv
      df.drop(columns=drop_columns, inplace=True)
      df.to_csv(export_path + "/" + "{}.csv".format(name), encoding='utf-8', index=False)

create_lookup_csvs()