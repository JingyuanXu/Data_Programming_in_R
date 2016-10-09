# Jingyuan Xu
# 2016.10.6

# runif generates random deviates. Then as.integer attempts to coerce its argument to be of integer type.
sample_size <- as.integer(runif(1, min=100, max=200)) 

# rnorm is random generation for the normal distribution with mean equal to 50 and standard deviation equal to 10.
sample <- rnorm(sample_size, mean=50, sd=10)

#what is the smallest value that length(sample) could report?  ---100
#The largest? ---200

sample_max<- sample[1]  # get the maximum
sample_order <- sample[order(sample)]
sample_length <- as.integer(length(sample)) # get the mininum

cov <- function(sample){
  sample_c <- c(sample)
   for (i in sample_c) {
     if (is.na(i)) {
       sample_c[i]=="NA"
     }
  }
}
