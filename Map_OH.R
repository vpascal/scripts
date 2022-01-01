library(ggplot2)
library(maps)
library(Hmisc)
library(mapproj)

county_df <- map_data('county')  #mappings of counties by state
coord <- mapproject(county_df$long,county_df$lat,projection = "lambert", parameters=c(39,42), orientation=c(90,0,-83) )
county_df$x <- coord$x
county_df$y <- coord$y
oh <- subset(county_df, region =="ohio")   #subset just for oh
oh$county <-oh$subregion

cnames <- aggregate(cbind(x, y) ~ subregion, data=oh,FUN=function(x)mean(range(x)))
cnames<-cnames[cnames$subregion %in% c("ashland","carroll","holmes","wayne","stark","knox","wayne","coshocton","tuscarawas","guernsey"),]
cnames$subregion <-capitalize(cnames$subregion)

oh$county[oh$county!="ashland"]<-"Rest of Ohio"

oh$county[oh$subregion=="holmes"]<-"Holmes"
oh$county[oh$subregion=="carroll"]<-"Carroll"
oh$county[oh$subregion=="guernsey"]<-"Guernsey"

oh$county[oh$subregion =="ashland"]<-"Neighboring Counties"
oh$county[oh$subregion=="wayne"]<-"Neighboring Counties"
oh$county[oh$subregion=="stark"]<-"Neighboring Counties"
oh$county[oh$subregion=="knox"]<-"Neighboring Counties"
oh$county[oh$subregion=="coshocton"]<-"Neighboring Counties"
oh$county[oh$subregion=="tuscarawas"]<-"Neighboring Counties"

p<-ggplot(oh, aes(x, y)) + geom_polygon(aes(group=group,fill=county), colour="white")+ coord_map()+geom_text(data=cnames, aes(label = subregion),colour='white', size=3)+scale_fill_manual(values = c("#999999","blue", "#56B4E9","#009E73","#95C9D8"))

p+theme(panel.border=element_blank(),panel.grid.major=element_blank(),panel.background=element_blank(),axis.title=element_blank(),axis.text=element_blank(),axis.ticks=element_blank())
