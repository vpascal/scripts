import pandas as pd
import numpy as np

# The resulting dataframe should have 67 columns, and 10,730 rows.

file = 'C:\\Users\\pascalv\\Downloads\\City_Zhvi_AllHomes.csv'

states = {'OH': 'Ohio', 'KY': 'Kentucky', 'AS': 'American Samoa', 'NV': 'Nevada', 'WY': 'Wyoming', 'NA': 'National', 'AL': 'Alabama', 'MD': 'Maryland', 'AK': 'Alaska', 'UT': 'Utah', 'OR': 'Oregon', 'MT': 'Montana', 'IL': 'Illinois', 'TN': 'Tennessee', 'DC': 'District of Columbia', 'VT': 'Vermont', 'ID': 'Idaho', 'AR': 'Arkansas', 'ME': 'Maine', 'WA': 'Washington', 'HI': 'Hawaii', 'WI': 'Wisconsin', 'MI': 'Michigan', 'IN': 'Indiana', 'NJ': 'New Jersey', 'AZ': 'Arizona', 'GU': 'Guam', 'MS': 'Mississippi', 'PR': 'Puerto Rico', 'NC': 'North Carolina', 'TX': 'Texas', 'SD': 'South Dakota', 'MP': 'Northern Mariana Islands', 'IA': 'Iowa', 'MO': 'Missouri', 'CT': 'Connecticut', 'WV': 'West Virginia', 'SC': 'South Carolina', 'LA': 'Louisiana', 'KS': 'Kansas', 'NY': 'New York', 'NE': 'Nebraska', 'OK': 'Oklahoma', 'FL': 'Florida', 'CA': 'California', 'CO': 'Colorado', 'PA': 'Pennsylvania', 'DE': 'Delaware', 'NM': 'New Mexico', 'RI': 'Rhode Island', 'MN': 'Minnesota', 'VI': 'Virgin Islands', 'NH': 'New Hampshire', 'MA': 'Massachusetts', 'GA': 'Georgia', 'ND': 'North Dakota', 'VA': 'Virginia'}
    
data = pd.read_csv(file,index_col=['RegionID', 'RegionName','State'])
data = data.loc[:, '2000-01':'2016-08']
cols = data.columns.values.tolist()

def convert_to_quarter(d):
    ts = pd.Timestamp(pd.to_datetime(d,format='%Y-%m'))
    return "{}Q{}".format(ts.year, ts.quarter)

# Python 3 map wrap in list
cols_new = list(map(convert_to_quarter,cols))
cols_new =  [x.lower() for x in cols_new]

# to replace columns, create a new dict with old and new names
col_new_dict = {i:j for i,j in zip(cols,cols_new)}
# and then just use rename method
data.rename(columns=col_new_dict, inplace=True)

data=data.reset_index()
data = pd.melt(data,id_vars=['RegionID', 'RegionName','State'])
#grouped = data.stack()
#grouped = data.groupby(['State','RegionName','variable'])['value'].reset_index()

#temp = pd.melt(data,id_vars=['RegionName','State'])
temp = pd.pivot_table(data, values='value', index=['RegionID','RegionName', 'State'], columns=['variable'], aggfunc=np.mean).reset_index()

temp['myState'] = temp['State']
temp['myState'] = temp['State'].replace(states, inplace=True)
temp.columns.name = None
temp = temp.set_index(['State','RegionName'])
temp = temp.drop('RegionID', 1)
temp = temp.drop('myState', 1)
