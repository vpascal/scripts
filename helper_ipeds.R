# this function helps to extract specific files from zipped folders in the IPEDS data archives.

library(purrr)
library(readr)

extract_files <- function(x, text=FALSE) {
  temp <- map(.f = unzip, .x = x, list = TRUE)
  files <- vector()
  
  for (i in temp) {
    if (nrow(i) == 2) {
      files <- rbind(files, i$Name[2])
    } else {
      files <- rbind(files, i$Name[1])
    }
  }
  
  files <- as.character(files)
  
  for (i in seq_along(files)) {
    unzip(x[i], files = files[i], exdir = 'temp')
  }
  
  final_files <- dir(path = "temp/",
                     pattern = "csv",
                     full.names = T)
  
  if (text == TRUE){
    
   temp1 <-   map(.x = final_files,.f = read_csv, col_types = cols(.default = "c"))
   map2_df(temp1, final_files, function(x, y) cbind(x, "file_name" = y))
  
  } else{
    
   temp1 <- map(.x = final_files, .f = read_csv)
   map2_df(temp1, final_files, function(x, y) cbind(x, "file_name" = y))
  }
  
  
}

# examples
# temp <- extract_files(files)
# unlink("temp",recursive=TRUE)
