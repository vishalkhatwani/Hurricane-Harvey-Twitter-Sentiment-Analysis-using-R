hur.hrv <- read.csv(file.choose())
View(hur.hrv)
summary(hur.hrv)
str(hur.hrv)
btw <- hur.hrv$Tweet[1:100000]

btw <- paste(btw, collapse = " ")
class(btw)
btw <- gsub(pattern = "\\W", replace = " ", btw)
btw <- gsub(pattern = "\\W", replace = " ", btw)
btw
btw <- tolower(btw)
btw
btw <- removeWords(btw, stopwords())
btw
btw <- gsub(pattern = "\\b[A-z]\\b{1}",replace=" ",btw)
btw
btw <- stripWhitespace(btw)
btw
btw <- str_split(btw, pattern = "\\s+")
btw
class(btw)
btw <- unlist(btw)
btw
match(btw,positive)
positives <- sum(!is.na(match(btw,positive)))
positives
negatives <- sum(!is.na(match(btw,negative)))
negatives
wordcloud(btw,min.freq = 25,color=rainbow(10))

install.packages("twitteR")
library("twitteR")
install.packages("RCurl")
library("RCurl")
require(twitteR)
require(RCurl)
library("tm")


xx <- as.character(btw)
xx
str(xx)

twit_corpus <- Corpus(VectorSource(xx))
twit_corpus
inspect(twit_corpus)[1]
inspect(twit_corpus[1])
inspect(twit_corpus[1000])

twit_clean <- tm_map(twit_corpus, removePunctuation)
twit_clean
twit_clean <- tm_map(twit_clean, content_transformer(tolower))
twit_clean <- tm_map(twit_clean, removeWords, stopwords("english"))
twit_clean <- tm_map(twit_clean, removeNumbers)
twit_clean <- tm_map(twit_clean, stripWhitespace)
twit_clean <- tm_map(twit_clean, removeWords, c("hurricaneharvey"))

wordcloud(twit_clean)
wordcloud(twit_clean, random.order = F,max.words = 200,colors = brewer.pal(8, "Dark2"))

positives <- sum(!is.na(match(twit_clean,positive)))
positives
negatives <- sum(!is.na(match(btw,negative)))
negatives

tdm <- TermDocumentMatrix(twit_clean[1:2000])
m <- as.matrix(tdm)
v <- sort(rowSums(m),decreasing=TRUE)
d <- data.frame(word = names(v),freq=v)
head(d,20)


