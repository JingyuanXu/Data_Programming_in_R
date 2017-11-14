library(tidyr)
library(dplyr)

expr <- read.table(file= "imdb_tv_shows_ratings_2010.txt",
                   header = TRUE,
                   sep = "\t",
                   comment.char = "#",
                   stringsAsFactors = FALSE)
dfvote <- gather(data = expr, key=star, value=votevalue, star_1:star_10)
head(dfvote)
starnumber <- extract(dfvote,star,c("star_number"),regex = "star_([0-9]+)",remove=FALSE)
starnumber$star_number <- as.numeric(starnumber$star_number)   
averagerate <- function(starnumber){
  va <- sum(starnumber$votevalue * starnumber$star_number)/sum(starnumber$votevalue)
  sumvoteva <- sum(starnumber$votevalue)
  return ( data.frame(averatevalue=va, sumvotevalue = sumvoteva))
}
head(starnumber)
df4<-starnumber %>% 
  group_by(name,season) %>%                         
  do(averagerate(.))
head(df4)

df5 <- df4[df4$sumvotevalue>=100,]
df5[order(-df5$averatevalue),]

