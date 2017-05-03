# install.packages("stringr")
# install.packages("twitteR")
# install.packages("purrr")
# install.packages("tidytext")
# install.packages("dplyr")
# install.packages("tidyr")
# install.packages("lubridate")
# install.packages("scales")
# install.packages("broom")
# install.packages("ggplot2")


library(stringr)
library(twitteR)
library(purrr)
library(tidytext)
library(dplyr)
library(tidyr)
library(lubridate)
library(scales)
library(broom)
library(ggplot2)

consumerKey = 	'0ppSis0abzyBBEKq4Wle2mkQQ'
consumerSecret = 'XdFhYnYMyNPMe8SUtpojrCzqKIR5bg10x5t1HzQjMcCcZOL0CI'
accessToken = '146064028-H0771CDu3fhiOiF8xOvD0R3nwp03YzxC2kBr8fVc'
accessSecret = 'WStigiau31eiNXHriy9AC6cKttKPHxxo6pcAVSWJ6eOvW'
options(httr_oauth_cache=TRUE)

setup_twitter_oauth(consumer_key = consumerKey, consumer_secret = consumerSecret,
                    access_token = accessToken, access_secret = accessSecret)

trumptweets<- userTimeline("realDONALDTRUMP", n = 1000)
trumptweets_df <- tbl_df(map_df(trumptweets, as.data.frame))

united_tweets <- searchTwitter('united airline', n = 1000)


install.packages("tm")

library(twitteR)
library(SnowballC)
library(wordcloud)
library(tm)
library(stringr)
library(dplyr)




topwords <- 
  trumptweets_df %>%
  paste(collapse = " ") %>%
  str_split("\\s") %>%
  unlist %>%
  tolower %>%
  removePunctuation %>%
  removeWords(stopwords("english")) %>%
  #wordStem %>%
  .[. != ""] %>% 
  table %>%
  sort(decreasing = TRUE) %>%
  head(1000)

wordcloud(names(topwords), topwords, min.freq = 3)

