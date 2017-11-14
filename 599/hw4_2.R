samp <- rnorm(100, mean = 10, sd=2)
coeff_of_var <- function(samp){
  result <- sd(samp, na.rm=TRUE)/ mean(samp, na.rm=TRUE)
  return(result)
}
print(coeff_of_var(samp))

wages <- read.table("http://bit.ly/2xByQUX", header=T,sep="\t",stringsAsFactors=FALSE)
head(wages)
func <- coeff_of_var(wages$total_wages)
print(as.numeric(wages$entity_county))
ordered_by_cov <- reorder(x = wages$entity_county, X=as.numeric(wages$total_wages), FUN= coeff_of_var)
scores <- attr(ordered_by_cov, "scores")
print(scores)
