import pandas as pd

file = 'C:\\Users\\pascalv\\Downloads\\gdplev.xls'

names = ['quarter', 'gdp_current', 'gp_constant']    
    
data=pd.read_excel(file, skiprows = 220,parse_cols='E:G',header=None, names=names)
data['diff'] = data['gp_constant'].pct_change()
data['label']= data['diff'].map(lambda x: 1 if x>0  else 0 ) 
#data['year'] = data.quarter.str[:4]

temp=data.label.astype(str).str.cat()
temp = temp.index('000011')
temp =  pd.Series(range(temp, temp + 6))
temp = data.iloc[temp]

#temp = temp.iloc[0:1,0:1].to_string(index=False,header=False)
#temp = temp.iloc[5:6,0:1].to_string(index=False,header=False)

bottom = temp.gp_constant.idxmin()
temp = temp.loc[37,['quarter']].to_string(index=False,header=False)
