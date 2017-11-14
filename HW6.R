#Jingyuan Xu
# HW6 11.6
library(ggplot2)
df<-read.table("http://teaching.cgrb.oregonstate.edu/stats/rprog_f16/data/cali_wages_subset.txt", header = TRUE, sep = "\t", stringsAsFactors = FALSE)
set.seed(42)
small <- df[sample(nrow(df), 10), ]
p <- ggplot(small)
ggplot(small)+geom_bar(aes(x=entity_county))





