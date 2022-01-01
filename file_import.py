import pandas as pd
import os
import glob


path = "Z:\Ad-hoc Requests\HCS\credits\Class Roster"
files = glob.glob(os.path.join(path,"*.csv"))
print(files)


df = pd.concat((pd.read_csv(f,encoding='latin1') for f in files))

