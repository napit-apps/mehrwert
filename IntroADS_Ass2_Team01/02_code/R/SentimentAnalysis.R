# Code for Sentiment Analysis - Mandatory Assignment 2
# Introduction to Applied Data Science
# Linus von Klitzing and Alina Weiss


# clear workspace
rm(list = ls())

# path
path <- getwd()

# libraries
library(dplyr)
library(syuzhet)

# load cleaned data of game reviews
load(paste0(path, "/01_data/", "gamereviews_cleaned.RData"))


# Task 3: Sentiment Analysis of your Game Reviews


# 1: Manual Sentiment Analysis with Bing word list from Kaggle ----

# word lists as txt data in 01_data
# load positive and negative word lists
pos_lines <- readLines(paste0(path, "/01_data/", "positive-words.txt"))
pos_lines_filt <- pos_lines[!grepl("^;", pos_lines)] # filter header that starts rows with ";"
neg_lines <- readLines(paste0(path, "/01_data/", "negative-words.txt"))
neg_lines_filt <- neg_lines[!grepl("^;", neg_lines)]

# calculate sentiment score for every review
# appearances of positive (negative) give factor +1 (-1), corrected for "not" in front of word
reviews.basic_analysis <- mutate(reviews.clean, sent_score_basic = rep(0, nrow(reviews.clean)), 
                                 sent_basic = rep("", nrow(reviews.clean))) # new data frame with column for sentiment (score)
for (i in seq_along(reviews.basic_analysis$review)) { # loop over all reviews
  sent_score <- 0 # define sentiment score
  words <- str_split(reviews.basic_analysis$review[i], "\\s+")[[1]] # give single review as list of words
  for (j in seq_along(words)) { # loop over words of single review
    if(words[j] %in% pos_lines_filt) { # check if word is positive
      if(j > 1 && words[j-1] == "not") { # check if word before is negation "not"
        sent_score <- sent_score - 1
      } else {
        sent_score <- sent_score + 1
      }
    }
    if(words[j] %in% neg_lines_filt) { # check if word is negative
      if(j > 1 && words[j-1] == "not") { # check if word before is negation "not"
        sent_score <- sent_score + 1
      } else {
        sent_score <- sent_score - 1
      }
    }
  }
  reviews.basic_analysis$sent_score_basic[i] <- sent_score # write sentiment score
  if(sent_score == 0) { # write overall sentiment of review in dependence of the score
    reviews.basic_analysis$sent_basic[i] <- "neutral"
  } else if (sent_score < 0) {
    reviews.basic_analysis$sent_basic[i] <- "negative"
  } else {
    reviews.basic_analysis$sent_basic[i] <- "positive"
  }
}
# save dataframe to 01_data
save(reviews.basic_analysis, file = paste0(path, "/01_data/", "gamereviews_basic_analysis.RData"))


# 2: Deeper Sentiment Analysis using syuzhet ----

# create new data frame that includes sentiment scores from methods in syuzhet package
n_rows <- rep(0, nrow(reviews.basic_analysis)) # list of 0s with length that is number of rows/reviews
reviews.sentiment <- reviews.basic_analysis %>% 
  select(recommendationid, timestamp_created, review, voted_up, votes_up, votes_funny, weighted_vote_score, sent_score_basic) %>% # keep only relevant columns
  mutate(sent_syuzhet = n_rows, sent_bing = n_rows, sent_afinn = n_rows) %>% # add columns for other sentiment scores
  mutate(anger = n_rows, anticipation = n_rows, disgust = n_rows, fear = n_rows, joy = n_rows, sadness = n_rows, surprise = n_rows, 
         trust = n_rows, em_negative = n_rows, em_positive = n_rows) # add columns for emotions
# calculate sentiment scores and emotions for every review by looping over data frame
for(i in seq_along(reviews.sentiment$review)) {
  reviews.sentiment$sent_syuzhet[i] <- get_sentiment(reviews.sentiment$review[i], method = "syuzhet", language = "english")
  reviews.sentiment$sent_bing[i] <- get_sentiment(reviews.sentiment$review[i], method = "bing", language = "english")
  reviews.sentiment$sent_afinn[i] <- get_sentiment(reviews.sentiment$review[i], method = "afinn", language = "english")
  emotions <- get_nrc_sentiment(reviews.sentiment$review[1])
  reviews.sentiment[i, (ncol(reviews.sentiment) - 9):ncol(reviews.sentiment)] <- emotions
}
# save dataframe to 01_data
save(reviews.sentiment, file = paste0(path, "/01_data/", "gamereviews_sentiment.RData"))


