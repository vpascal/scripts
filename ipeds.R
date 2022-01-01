library(readr)
library(purrr)

source("helper_ipeds.R")


# Cxxxx_A -------------------------------------------------------------------------------------

files <- dir(pattern = "^C\\d{4}_A",recursive = TRUE)
pattern <- grep("Dict|SAS|DIST",ignore.case = T,x = files)

files <- files[-pattern]

C_A <- extract_files(files)
unlink("temp",recursive =TRUE)


# Cxxxx_B --------------------------------------------------------------------------------------

files <- dir(pattern = "^C\\d{4}_B",recursive = TRUE)
pattern <- grep("Dict|SAS|DIST",ignore.case = T,x = files)

files <- files[-pattern]

C_B <- extract_files(files)
unlink("temp",recursive =TRUE)


# Cxxxx_C --------------------------------------------------------------------------------------

files <- dir(pattern = "^C\\d{4}_C",recursive = TRUE)
pattern <- grep("Dict|SAS|DIST",ignore.case = T,x = files)

files <- files[-pattern]

C_C <- extract_files(files)
unlink("temp",recursive = TRUE)


# EDxxxxA_DIST --------------------------------------------------------------------------------

files <- dir(pattern = "EF\\d{4}A_DIST",recursive = TRUE)
pattern <- grep("Dict|SAS",ignore.case = T,x = files)

files <- files[-pattern]

EFA_DIST <- extract_files(files)
unlink("temp",recursive =TRUE)


# EFxxxxA -------------------------------------------------------------------------------------

files <- dir(pattern = "EF\\d{4}A",recursive = TRUE)
pattern <- grep("Dict|SAS|DIST",ignore.case = T,x = files)

files <- files[-pattern]

EF_A <- extract_files(files)
unlink("temp",recursive =TRUE)


# EFxxxxB -------------------------------------------------------------------------------------


files <- dir(pattern = "EF\\d{4}B",recursive = TRUE)
pattern <- grep("Dict|SAS|DIST",ignore.case = T,x = files)

files <- files[-pattern]

EF_B <- extract_files(files)
unlink("temp",recursive =TRUE)

# EFxxxxD -------------------------------------------------------------------------------------

files <- dir(pattern = "EF\\d{4}D",recursive = TRUE)
pattern <- grep("Dict|SAS|DIST",ignore.case = T,x = files)

files <- files[-pattern]

EF_D <- extract_files(files)
unlink("temp",recursive = TRUE)

# EFxxxxCP ------------------------------------------------------------------------------------

files <- dir(pattern = "EF\\d{4}CP",recursive = TRUE)
pattern <- grep("Dict|SAS|DIST",ignore.case = T,x = files)

files <- files[-pattern]
EF_CP <- extract_files(files)
unlink("temp",recursive =TRUE)

# EFxxxxC -------------------------------------------------------------------------------------

files <- dir(pattern = "EF\\d{4}C",recursive = TRUE)
pattern <- grep("Dict|SAS|DIST|CP",ignore.case = T,x = files)

files <- files[-pattern]
EF_C <- extract_files(files,text=TRUE)
unlink("temp",recursive = TRUE)


# EFEST -----------------------------------------------------------------------------------------

files <- dir(pattern = "EFEST\\d{4}",recursive = TRUE)
pattern <- grep("Dict|SAS|DIST|CP",ignore.case = T,x = files)
files <- files[-pattern]

EFEST <- extract_files(files)
unlink("temp",recursive = TRUE)

# EFFY ----------------------------------------------------------------------------------------

files <- dir(pattern = "EFFY\\d{4}",recursive = TRUE)
pattern <- grep("Dict|SAS|DIST|CP",ignore.case = T,x = files)
files <- files[-pattern]

EFFY <- extract_files(files)
unlink("temp",recursive = TRUE)

# EFIA ----------------------------------------------------------------------------------------

files <- dir(pattern = "EFIA\\d{4}",recursive = TRUE)
pattern <- grep("Dict|SAS|DIST|CP",ignore.case = T,x = files)
files <- files[-pattern]

EFIA <- extract_files(files)
unlink("temp",recursive = TRUE)

# F0607_F1A -----------------------------------------------------------------------------------
# Not sure if these are the separate surveys

files <- dir(pattern = "F0607_F1A",recursive = TRUE)
pattern <- grep("Dict|SAS|DIST|CP",ignore.case = T,x = files)
files <- files[-pattern]
F0607_F1A <- extract_files(files[1]); unlink("temp",recursive = TRUE)
F0607_F1A_F <- extract_files(files[2]); unlink("temp",recursive = TRUE)
F0607_F1A_G <- extract_files(files[3]); unlink("temp",recursive = TRUE)

# FLAGS ---------------------------------------------------------------------------------------
# Response status for all survey components

files <- dir(pattern = "FLAGS",recursive = TRUE)
pattern <- grep("Dict|SAS|DIST|\\(",ignore.case = T,x = files)
files <- files[-pattern]

FLAGS <- extract_files(files,text = TRUE)
unlink("temp",recursive = TRUE)

# GR ------------------------------------------------------------------------------------------

files <- dir(pattern = "GR",recursive = TRUE)
pattern <- grep("Dict|SAS|DIST|_L|_",ignore.case = T,x = files)
files <- files[-pattern]
GR <- extract_files(files,text = TRUE)
unlink("temp",recursive = TRUE)

# GR_L2 ---------------------------------------------------------------------------------------

files <- dir(pattern = "GR\\d{4}_L",recursive = TRUE)
pattern <- grep("_Dict|_SAS",ignore.case = T,x = files)
files <- files[-pattern]
GR_L2 <- extract_files(files)
unlink("temp",recursive = TRUE)

# GRxxx_xx ------------------------------------------------------------------------------------

files <- dir(pattern = "GR\\d{3}_",recursive = TRUE)
pattern <- grep("_Dict|_SAS",ignore.case = T,x = files)
files <- files[-pattern]
GR200_xx <- extract_files(files, text = TRUE)
unlink("temp",recursive = TRUE)

# HD ------------------------------------------------------------------------------------------

files <- dir(pattern = "HD",recursive = TRUE)
pattern <- grep("_Dict|_SAS",ignore.case = T,x = files)
files <- files[-pattern]
HD <- extract_files(files, text = TRUE)
unlink("temp",recursive = TRUE)

# IC ------------------------------------------------------------------------------------------

files <- dir(pattern = "IC",recursive = TRUE)
pattern <- grep("_Dict|_SAS|_PY|_AY|Mission|\\(",ignore.case = T,x = files)
files <- files[-pattern]
IC <- extract_files(files)
unlink("temp",recursive = TRUE)



# IC_AY ---------------------------------------------------------------------------------------


files <- dir(pattern = "IC\\d{4}_AY",recursive = TRUE)
pattern <- grep("_Dict|_SAS|_PY|Mission|\\(",ignore.case = T,x = files)
files <- files[-pattern]
IC_AY <- extract_files(files,text = TRUE)
unlink("temp",recursive = TRUE)

# IC_PY ---------------------------------------------------------------------------------------

files <- dir(pattern = "IC\\d{4}_PY",recursive = TRUE)
pattern <- grep("_Dict|_SAS|Mission|\\(",ignore.case = T,x = files)
files <- files[-pattern]
IC_PY <- extract_files(files, text=TRUE)
unlink("temp",recursive = TRUE)

# IC_Mission ----------------------------------------------------------------------------------

files <- dir(pattern = "IC\\d{4}Mission",recursive = TRUE)
pattern <- grep("Dict|SAS",ignore.case = T,x = files)
files <- files[-pattern]
IC_Mission <- extract_files(files)
unlink("temp",recursive = TRUE)

# SFA -----------------------------------------------------------------------------------------

files <- dir(pattern = "SFA",recursive = TRUE)
pattern <- grep("Dict|SAS|\\(|AV",ignore.case = T,x = files)
files <- files[-pattern]
SFA <- extract_files(files)
unlink("temp",recursive = TRUE)

# SFA_V (for veterans) -----------------------------------------------------------------------------------------

files <- dir(pattern = "SFAV",recursive = TRUE)
pattern <- grep("Dict|SAS|\\(",ignore.case = T,x = files)
files <- files[-pattern]
SFAV <- extract_files(files)
unlink("temp",recursive = TRUE)


# Other ---------------------------------------------------------------------------------------
# There are additional files in the 2015 folder: ADM2015, S2015_NH/_OC/_SIS and SAL2015_IS/_NIS. 

ADM2015 <- read_csv("AY2015/ADM2015.zip")
S2015_NH <- read_csv("AY2015/S2015_NH.zip")
S2015_OC <- read_csv("AY2015/S2015_OC.zip")
S2015_SIS <- read_csv("AY2015/S2015_SIS.zip")
SAL2015_IS <- read_csv("AY2015/SAL2015_IS.zip")
SAL2015_NIS <- read_csv("AY2015/SAL2015_NIS.zip")



# Export --------------------------------------------------------------------------------------

to_export <- ls()[grepl('data.frame', sapply(ls(), function(x) class(get(x))))]

for(file in to_export){

    write_csv(get(file), paste0('C:/Users/pascalv/Documents/Export/',file,".csv"),na = "")
  
}



