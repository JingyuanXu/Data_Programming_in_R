states <- read.table(file= "states.txt",
                     header = TRUE,
                     sep = "\t",
                     comment.char = "#",
                     stringsAsFactors = FALSE)
print(class(states)) # data.frame
print(length(states)) # check the length of the data frame
print(class(states[[1]])) # character
print(class(states[[2]])) # integer
print(class(states[[3]])) # integer
print(class(states[[4]])) # numeric
print(class(states[[5]])) # numeric
print(class(states[[6]])) # character
