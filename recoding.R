c<-data.frame(data=c("yes","no", 'no', "yes", "maybe"))


# d<-c$data
# f<-function(x){switch(as.character(x), yes=1, no=2, "rest")}
# d<-sapply(d,f)
# c<-cbind(c,d)
# c

####################################

lookup<-c(yes=1, no=2, maybe=99)
c$data<-lookup[c$data]

####################################

recode <- function(x){
  switch(as.character(x), yes=1,no=2, maybe=3, "rest")
}
  
vlad<-data.frame(value=c("yes","yes","maybe","sdf"),value2=c("yes","maybe","dddd", "yes"))

for(i in names(vlad)){
vlad[i] <- apply(vlad[i],1,recode)}


#######################

options(stringsAsFactors=F)

pattern<-grep("yes",vlad$value)
pattern2<-grep("yes",vlad$value2)
vlad[union(pattern, pattern2),]


########################

