# Code for Data Cleaning - Mandatory Assignment 2
# Introduction to Applied Data Science
# Linus von Klitzing and Alina Weiss


# clear workspace
rm(list = ls())

# path
path <- getwd()

# libraries
library(stringr)
library(dplyr)
library(hunspell)
library(tm)

# load raw data (game reviews)
load(paste0(path, "/../../01_data/raw/", "gamereviews.RData"))


# Task 2: Clean your Game Reviews

# copy data frame for following cleaning operations
reviews.clean <- game.rev

# delete all non-ascii characters
reviews.clean$review <- str_remove_all(reviews.clean$review, "[^[:ascii:]]")
# delete external urls
reviews.clean$review <- str_replace_all(reviews.clean$review, "https?://.+", "")
# replace letters that occur three times or more in a row with only one of the respective letters
reviews.clean$review <- str_replace_all(reviews.clean$review, "(.)\\1{2,}", "\\1")
# turn all upper case letters into lower case letters
reviews.clean$review <- tolower(reviews.clean$review)
# transform all abbreviation "n't" into "not" - all letters have to be turned to lower case bevor 
reviews.clean$review <- str_replace_all(reviews.clean$review, "\\b(\\w+)n't\\b", "\\1 not")
# no deletion of numbers because there is sentiment information in words like "2-faced"
# delete all punctuations
reviews.clean$review <- str_remove_all(reviews.clean$review, "[[:punct:]]")
# replace new lines with an empty space
reviews.clean$review <- str_replace_all(reviews.clean$review, "\\n", " ")
# remove white space at beginning
reviews.clean$review <- str_trim(reviews.clean$review, side = "left")
# remove white space at end
reviews.clean$review <- str_trim(reviews.clean$review, side = "right")
# replace more than one empty space following each other with just one empty space
reviews.clean$review <- str_replace_all(reviews.clean$review, "\\s+", " ")
# replace reviews consisting out of a single character with an empty character
reviews.clean$review <- ifelse(str_length(reviews.clean$review) > 1, reviews.clean$review, "")
# (spell check reviews with hunspell and) delete stopwords except (not) by looping over them
# no spell checking, because misspelled words included in word list
stop_words <- setdiff(stopwords("english"), "not")
for (i in seq_along(reviews.clean$review)) {
  words <- str_split(reviews.clean$review[i], "\\s+")[[1]]
  words_without_stop <- words[!words %in% stop_words]
  reviews.clean$review[i] <- paste(words_without_stop, collapse = " ")
}
# delete all empty reviews
reviews.clean <- reviews.clean %>% filter(reviews.clean$review != "")

# save dataset in 01_data
save(reviews.clean, file = paste0(path, "/../../01_data/", "gamereviews_cleaned.RData"))
