#Jingyuan Xu
# hw4 11.12 #resubmit for regrading
library(dplyr)
df<- read.table("http://teaching.cgrb.oregonstate.edu/stats/rprog_f16/data/california_state_university_employees_2013.txt",header = TRUE,sep="\t",stringsAsFactors = FALSE)
#1
mydf<-df[ , (colnames(df) %in% c("entity_county","position","total_wages") ) ]

#2 reference with class code, but not sure is right for the problem
mean_of_total_wages<-function(mydf,remove_nas=FALSE){
  mean1<- mean(mydf$total_wages)
  cov1<- sd(mydf$total_wages,na.rm = remove_nas)/mean1
  ref1<-data.frame(mean=mean1,cov=cov1)
  return (mean1)
}
#3 find the largest mean
# question: although I get the result, but the result is different with the reference. I feel confuse about this

df_largest<-mydf[order(mydf$total_wages),]
largest_row<-df_largest[nrow(df_largest),]
print(mean_of_total_wages(largest_row))

by_county <- group_by(mydf, entity_county)
df_largest<-do(by_county, mean_of_total_wages(.))
df_largest[which.max(df_largest$mean),]

#4 filiter with position:
df_position<-group_by(mydf,position)
#this line get the error: Error: Results are not data frames at positions. 
#I searched online, but don't know how to convert it into the dataframe
mean_position<-do(df_position,mean_of_total_wages(.))
print(mean_position)
