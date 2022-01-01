library(maps)
library(mapproj)
library(mapdata)

map('world', fill = TRUE,col = "grey",border="white")
map("worldHires", c("New Zealand","South Africa","Ireland","Netherlands","Botswana","Thailand","Italy","France"), add=TRUE,fill = T, col="darkgreen", border="White")
