race_collapse1 <- function(race1){
  
  race1 <- purrr::map_df(race1, as.character)  
  
  temp <- apply(
    apply(race1, 2, function(x) !is.na(x)),
    1, sum)
 
  temp[temp>1] <- 'Two or More'
  temp[temp==0] <- 'Unknown'
 
  ifelse(temp==1,coalesce(!!!race1),temp)
}
