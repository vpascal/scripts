# binding a list of files of different sizes


library(readr)
library(purrr)
library(dplyr)

files <- dir(pattern = "csv")
info <-  file.info(files)
empty <-  rownames(info[info$size == 0,])
non_empty <- rownames(info[info$size > 0,])

mylist <- map(non_empty, read_csv)
names(mylist) <- non_empty

max.rows <- max(unlist(lapply(mylist, nrow), use.names = F))

list.df <- lapply(mylist, function(x) {
  na.count <- max.rows - nrow(x)
  if (na.count > 0L) {
    na.dm <- matrix(NA, na.count, ncol(x))
    colnames(na.dm) <- colnames(x)
    rbind(x, na.dm)
  } else {
    x
  }
})

temp <- bind_cols(list.df)
names(temp) <- non_empty

openxlsx::write.xlsx(temp, "final.xlsx")
write.table(empty, file = "clipboard")
