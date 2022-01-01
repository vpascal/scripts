library(maptools)
gpclibPermit()
library(rgeos)
library(sp)
library(ggplot2)
library(rgdal)
library(rgeos)
library(ggmap)

a<-readShapeSpatial("MDA_Adm1", repair=T)
proj4string(a) <- CRS("+proj=longlat +datum=NAD27")
map <- fortify(map, region="NAME_1")

# this is the border
b<-readShapeSpatial("MDA_Adm0", repair=T)
proj4string(b) <- CRS("+proj=longlat +datum=NAD27")
area_b <- fortify(a, region="NAME_1")


area$Value[area$id =="Cahul"]<-"Cahul"
area$Value[area$id =="Hîncesti"]<-"Hincesti"
area$Value[area$id =="Soroca"]<-"Soroca"
area$Value[area$id =="Drochia"]<-"Drochia"
area$Value[area$id =="Calarasi"]<-"Calarasi"
area$Value[area$id =="Gagauzia"]<-"Gagauzia"
area$Value[area$id =="Leova"]<-"Leova"
area$Value[area$id =="Orhei"]<-"Orhei"
area$Value[area$id =="Taraclia"]<-"Taraclia"
area$Value[area$id =="Telenesti"]<-"Telenesti"
area$Value[area$id =="Ungheni"]<-"Ungheni"
area$Value[area$id =="Orhei"]<-"Orhei"
area$Value[area$id =="Calarasi"]<-"Calarasi"  
area$Value[area$id =="Causeni"]<-"Causeni"
area$Key<-ifelse(area$Value == area$id,"Pilot Raions",NA)

#names(all)<-c("Date","id","Question","Value")

#area<-join(area,all, by = "id",type="left")
area<-area[c("long","lat","order","hole","piece","group","id","Value")]
#area[!area$id %in% c("Calarasi","Causeni","Chisinau","Drochia","Cahul","Gagauzia","Hincesti","Leova", "Orhei","Soroca","Taraclia","Telenesti","Ungheni"),7]<-NA

#raion<-area[area$id %in% c("Calarasi","Causeni","Chisinau","Drochia","Cahul","Gagauzia","Hincesti","Leova", "Orhei","Soroca","Taraclia","Telenesti","Ungheni"),]
#raion<-raion[c("long","lat","id")]
#raion<-aggregate(cbind(lat, long) ~ id, data=raion, FUN=function(x)mean(range(x)))


places<-readShapeSpatial("places.shp", repair=T)
proj4string(places) <- CRS("+proj=longlat +datum=NAD27")
places<-data.frame(places)
places<-subset(places, type=="village" | type=="town")



p<-ggplot(area,aes(long, lat,))+geom_polygon(aes(group=group, fill=Value),colour="white")+ coord_map()
p<-p+theme(panel.border=element_blank(),panel.grid.major=element_blank(),panel.background=element_blank(),axis.title=element_blank(),axis.text=element_blank(),axis.ticks=element_blank())
p<-p+scale_fill_gradient(limits=c(100, 3000),low="red", high="green")
p+geom_text(data=raion,aes(label = id),colour='black', size=3)+theme(legend.position = "none")


################################
a$id <- 1:nrow(a)


ggplot(area,aes(long, lat))+geom_polygon(aes(group=group, fill=Value),colour="white")+
#geom_point(data=a,aes(coords.x1,coords.x2))+coord_map()+
theme(panel.border=element_blank(),panel.grid.major=element_blank(),panel.background=element_blank(),axis.title=element_blank(),axis.text=element_blank(),axis.ticks=element_blank())
##############################################
#a- original shapefile; using base r
par(mai=c(0,0,0,0))
plot(a, col="orange", border="white")
#map.cities(country = "Moldova",label=TRUE,parameters=projection("NAD27"))
#map.cities(country = "Moldova",label=TRUE)
text(coordinates(a),labels=a$NAME_1,cex=.75)
plot(places, add=TRUE,pch=20,cex=0.5)
#text(coordinates(places),labels=places$name,cex=.5,col="blue")
map.scale(ratio=FALSE)






