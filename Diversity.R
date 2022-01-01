library(rvest)
library(dplyr)

url <- 'https://www.ohio.edu/instres/faculty/staffstats/AllStaffSexRacePlanUnit.htm'

html <- read_html(url)
table <- html %>% html_table(fill=TRUE)
table <- data.frame(table)

# these are the rows that correspond to PCOE; double check if correct.
education <- table[40:49,]
education <- education %>%  mutate_at(c(2:22),function(x) as.numeric(x))

# these are the rows the correspond to OU; double check.
ou <- table[268:277,]
ou <- ou %>% mutate_at(c(2:22),function(x) as.numeric(gsub(",","",x)))

# preparing subsets

faculty <- paste('X',c(1:7),sep='')
staff <- paste("X", c(1,8:19),sep='')

education_faculty <- education[faculty]
ou_faculty <- ou[faculty]

education_staff <- education[staff]
ou_staff <- ou[staff]  
  

################## check

education_faculty %>% mutate(Faculty_male = (X2+X5)/(X4+X7) * 100,
                     Faculty_female = X3+X6/(X4+X7)* 100
)

################ export to excel
write.csv(ou_staff,"temp.csv", row.names = F)
