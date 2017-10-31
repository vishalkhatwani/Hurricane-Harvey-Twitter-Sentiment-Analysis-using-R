getwd()
df <- readLines("test_article.txt")
df
class(df)
str(df)
df1 <- paste(df, collapse = " ")
df1
df2 <- gsub(pattern = "\\W", replace = " ", df1)
df2
df3 <- gsub(pattern = "\\d", replace= " ", df2)
df3
df3 <- tolower(df3)
df3

install.packages("tm")
library(tm)
stopwords()

df3 <- removeWords(df3, stopwords())
df3

df3 <- gsub(pattern = "\\b[A-z]\\b{1}",replace=" ",df3)
df3

df3 <- stripWhitespace(df3)
df3

install.packages("stringr")
install.packages("wordcloud")

library(stringr)
library(wordcloud)

df4 <- str_split(df3, pattern = "\\s+")
df4
class(df4)
df4 <- unlist(df4)
class(df4)
df4
str(df4)

positive <- readLines("positive.txt")
negative <- readLines("negative.txt") 

match(df4,positive)

!is.na(match(df4,positive))

pos.terms <- sum(!is.na(match(df4,positive)))
neg.terms <- sum(!is.na(match(df4,negative)))
score <- pos.terms - neg.terms
score
wordcloud(df3)
wordcloud(df3, min.freq = 3)
wordcloud(df3, min.freq = 2, random.order = FALSE,color=rainbow(3))
