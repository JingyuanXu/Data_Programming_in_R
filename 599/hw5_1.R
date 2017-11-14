library(tidyr)
library(dplyr)

expr <- read.table(file= "imdb_tv_shows_ratings_2010.txt",
                   header = TRUE,
                   sep = "\t",
                   comment.char = "#",
                   stringsAsFactors = FALSE) 
dfvote <- gather(data = expr, key=star, value=votevalue, star_1:star_10)
head(dfvote)
df2<-dfvote %>% 
  group_by(name,episode_name,season) %>%                         
  summarise(sumvote=sum(votevalue))
head(df2)
group_vote <- group_by(df2,name,episode_name)
group_vote[order(-group_vote$sumvote),]
