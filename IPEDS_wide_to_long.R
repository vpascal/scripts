library(tidyverse)
library(readr)

data <- read_csv('IPEDS Tuition and Scholarship Data_3-3-2021.csv')

# 1. extract variable names and remove numeric characters
labels <- names(data)
labels <- str_remove(labels,pattern ='\\d{4}')

# 2. create year for each block of questions
vars <- names(data)
vars <- str_extract(vars,pattern ='\\d{4}')
vars <- as.numeric(substr(vars,3,4))
look_behind <- vars-1
vars <- paste(look_behind,vars,sep = '-')

# 3. combine 1 and 2 and do some cleaning
labels <- paste(vars,labels,sep = ' ')
labels[1] <- 'UnitID'
labels[2] <- 'Institution'
labels <- gsub('\\(.+?\\)','',labels)
labels <- gsub('\\s+$','',labels)
names(data) <- labels

# 4.  Reshape and clean
temp <- data %>% pivot_longer(cols = 3:173)
temp$year <- str_extract(temp$name,pattern ='\\d{2}-\\d{2}')
temp$name <- str_remove(temp$name,pattern = '\\d{2}-\\d{2}')
temp$year <- paste0('20',temp$year)

# 5. Reshape back and export.
temp_2 <- temp %>% pivot_wider(id_cols = c(1,2,5))

#. Export
write.csv(temp_2, 'IPEDS Long Format.csv', row.names = F)
