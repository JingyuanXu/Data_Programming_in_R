#jingyuan xu
# 10.12
#No.1
cali_wages <- read.table("http://teaching.cgrb.oregonstate.edu/stats/rprog_f16/data/california_state_university_employees_2013.txt",header = TRUE,sep="\t",stringsAsFactors = FALSE)
#No.2
city <- c("Orange")
cali_orange <- cali_wages[cali_wages$entity_county %in% city,]
print(head(cali_orange))
print(summary(cali_orange))
#No.3
cali_colmname <- cali_wages$entity_county
unique(cali_colmname)
#No.4
city <- c("San Bernardino","Alameda","Kern")
cali_city_salary <- cali_wages[cali_wages$entity_county %in% city,]
cali_city_salary <- cali_wages[cali_wages$entity_county == city,]
min_10k <- subset(cali_city_salary,cali_city_salary$total_wages>100000)
print(nrow(min_10k))
#No.5
cali_wages_sorted <-cali_wages[sort.list(cali_wages$total_wages,na.last = TRUE),] 
#No.6
# have some problems, need help
b=as.vector(cali_wages$entity_name)
c=unlist(strsplit(b,split=","))
matrix(c,ncol=2,byrow=T)
cali_wages$university_type <- c[1]
#No.7
# my problem is: when I use %n%, I can't find out "Student", so all cells are filled in with "other"
cali_wages$position_type = ifelse(cali_wages$position %in% "Student","student",ifelse(cali_wages$position %in% "Administra","administration",ifelse(cali_wages$position %in%" Faculty","faculty","other")))

#No.8
cali_wages$position_type_fac<-cali_wages$position_type
cali_wages$position_type_fac<-cali_wages[sort.list(cali_wages$position_type_fac),]

