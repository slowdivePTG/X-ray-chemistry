import pandas as pd
import os

table = pd.read_csv('grain_react.csv', index_col=0).fillna('')
for i in table.index:
    print(table.loc[i].keys())
    for key in table.loc[i].keys():
        if len(table.loc[i][key])>0:
            table.loc[i][key] = r'$\ce{' + table.loc[i][key] + '}$'
table.to_csv('Grain_Reaction.csv', index=False)
os.system('python tably.py Grain_Reaction.csv')
