academic_year <- function(x){
  
  c <- substr(x, 2,3)
  first <- as.numeric(substr(x, 1,1))
  year <- ifelse(first==2, as.numeric(paste0("20",c)), as.numeric(paste0("19",c)))
  prev_year <- year-1
  paste(prev_year,substr(year,3,4),sep="-")
}


# academic_year("1955")
# term <- c("1955","1995","2055","2155")
# academic_year(term)
# 
# sapply(term, academic_year)
