data <- data.frame(County=c("Athens","Gallia","Hocking","Jackson","Meigs","Morgan","Perry","Vinton"), Percent=c(28.8,14.7,13.7,17.3,11.9,10.7,11.0,8.7))
barplot(data$Percent, col="orange",names.arg = data$County,ylim=c(0, 35),border="white",las=1)
abline(h = 29.3, col="red")
abline(h = 22.2, col="blue")
abline(h = 25.6, col="darkgreen")
grid()


library(ggplot2)
library(dplyr)

data <- data %>% arrange(desc(Percent))
ggplot(data=data,aes(y = County,x=Percent))+geom_point()+
geom_segment(aes(x = 0, y = County, xend = Percent, yend = County), color = "grey50")

