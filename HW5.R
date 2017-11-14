#Jingyuan Xu
#HW5 11.6
library(tidyr)
library(dplyr)
#1
map_nums<-function(r,n){
  x<-array()
  x[1]=0.5
  for(i in 2:n){
    x[i]<-r*x[i-1]*(1-x[i-1])
  }
  return(x)
}
plot(head(map_nums(3.7,100), n = 100), type = "l")

#2
cali_wages <- read.table("http://teaching.cgrb.oregonstate.edu/stats/rprog_f16/data/cali_wages_subset.txt", header = TRUE, sep = "\t", stringsAsFactors = FALSE)
keep_counties <- c("Alameda", "Fresno", "Sonoma", "Orange", "Humboldt")
#2.1 
# correct
#return 241 rows, 
#the result shows the data value in "entity_county" column contain these counties: Alameda, Fresno, Sonoma, Orange, Humboldt 
keepers<-cali_wages[cali_wages$entity_county %in% keep_counties,]
summary(keepers)

#2.2
#correct
#return 59 rows,
# the result shows the data value in "entity_county" column  exactly equal to counties: Alameda, Fresno, Sonoma, Orange, Humboldt 
keepers<-cali_wages[cali_wages$entity_county == keep_counties,]
summary(keepers)

#2.3 
# error
keepers<-cali_wages[cali_wages,keep_counties]


#2.4
#correct,row is 241, this is same as 2.1
keepers<-subset(cali_wages,entity_county %in% keep_counties)
summary(keepers)

#2.5
#correct,row is 59, this is same as 2.2
keepers<-subset(cali_wages,entity_county ==keep_counties)
summary(keepers)

#2.6
#error, subset must be logical
keepers<-subset(cali_wages,keep_counties)

#3
cali_wages$mean_total_wages<-mean(cali_wages$total_wages)
cali_wages$mean_health_dental_vision<-mean(cali_wages$health_dental_vision)
data_long<-gather(cali_wages,earning_type,mean_value,mean_total_wages:mean_health_dental_vision)
data_long<-data_long[!duplicated(data_long),]
data_wide<-spread(data_long,entity_county,mean_value)# the data frame doesn't like the example, my contains many "NA"s, how to change this?