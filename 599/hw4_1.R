
library(dplyr)
expr <- read.table(file= "/Volumes/Transcend/Downloads/GREvideo/expr_long_coded_clean.txt",
                     header = TRUE,
                     sep = "\t",
                     comment.char = "#",
                     stringsAsFactors = FALSE)
keep_ids <- expr$id[expr$expression > median(expr$expression)] 
head(keep_ids)
#example:  X <- c(2,4,6,2)
#          Y <- c(6,2)
# for %in% , x%in% y will get: [T,F,T,T],it will check all items in Y and compare with X
# for "==" will get: [F,F,T,T], it will check cyclic. 
expr <- expr[expr$id %in% keep_ids, ]
expr <- expr[expr$id == keep_ids, ]

# SHAWN: why is this the wrong expression, and how does it differ from %in%?
expr <- expr[keep_ids, ]
#because in here we use character vector instead of a logical vector, and the character vector will try to match the row names and it doesn't work
print(expr) 
# SHAWN: what is it attempting to do here, even if it did work? (Hint: the three main ways of indexing [numeric vector, logical vector, character vector] apply to data frames too)

#the first expression is same as the second expression, and these two are same as:expr <- expr[expr$id %in% keep_ids, ] 
expr <- subset(expr, id %in% keep_ids)
print(expr)
expr <- subset(expr, id == keep_ids)
print(expr)
#the third expression is wrong, here we should use logical vector instead of character vector
expr <- subset(expr, keep_ids)
