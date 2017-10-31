text <- c("Because I could not stop for Death -",
          "He kindly stopped for me -",
          "The Carriage held but just Ourselves -",
          "and Immortality")

text

library(dplyr)

text_df <- data_frame(line = 1:4, text = text)

text_df

library(tidytext)

a <- text_df %>%
  unnest_tokens(word, text)
a
table(a)
hist(a)
summary(a)
