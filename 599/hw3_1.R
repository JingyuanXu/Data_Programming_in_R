# SHAWN: my computer doesn't have an E:\\!
states <- read.table(file = "states.txt", header = TRUE, sep = "\t",comment.char = "#",stringsAsFactors = FALSE)
murder <- states$murder
region <- states$region

# this function is also reading from variables that are not passed in as parameters
# (specifically murder and region); you can get these from the parameters passed in as a$murder and a$region
compare_murder_regions <- function(a,b,c){
  murder_rate_b <- murder[region==b]
  murder_rate_c <- murder[region==c]
  t_test <- t.test(murder_rate_c,murder_rate_b)
  result <- t_test$p.value
  return(result)
}
res <- compare_murder_regions(states, "West","South")
print(res)
print(compare_murder_regions(state,"North Central","South"))
