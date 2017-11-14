# SHAWN: E:\\ not found, also see comments on #1
states <- read.table(file = "states.txt", header = TRUE, sep = "\t",comment.char = "#",stringsAsFactors = FALSE)
murder <- states$murder
region <- states$region
compare_murder_regions2 <- function(a,b,c){
  murder_rate_b <- murder[region==b]
  murder_rate_c <- murder[region==c]
  t_test <- t.test(murder_rate_c,murder_rate_b)
  da <- list()
  pval <- t_test$p.value
  
  mean_region1<-mean(murder_rate_b)
  mean_region2<-mean(murder_rate_c)
  data <- cbind(pval,mean_region1,mean_region2)
  
  return(data)
}
res <- compare_murder_regions2(states, "West","South")
print(res)

print(compare_murder_regions2(states,"North Central","South"))
