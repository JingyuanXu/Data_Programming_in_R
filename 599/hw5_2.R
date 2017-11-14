library(tidyr)
library(dplyr)
#expr <- read.table(file= "E:\\imdb_tv_shows_ratings_2010.txt",
# EDITED BY SHAWN: I don't have a E:\\ on my computer
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
 return ( data.frame(averatevalue=va))
}
head(starnumber)
df3<-starnumber %>% 
  group_by(name,season) %>%                         
  do(averagerate(.))
head(df3)

df3[order(-df3$averatevalue),]
