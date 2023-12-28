# Code for Sentiment Visualization - Mandatory Assignment 2
# Introduction to Applied Data Science
# Linus von Klitzing and Alina Weiss


# clear workspace
rm(list = ls())

# path
path <- getwd()

# libraries
library(dplyr)
library(wordcloud2)
library(tm)
library(ggplot2)

# load sentiment data for basic and in depth analysis
load(paste0(path, "/../../01_data/", "gamereviews_basic_analysis.RData"))
load(paste0(path, "/../../01_data/", "gamereviews_sentiment.RData"))


# Basic Analysis ----

# create histogram of for sentiment scores
# trim most extreme value (somebody produced a score of -198 by simply repeating the same word)
reviews.basic_analysis <- reviews.basic_analysis %>% filter(reviews.basic_analysis$sent_score_basic > -50)
# plot and save
png(paste0(path, "/../../03_report/graphs/", "basic_sentiment_scores.png"))
hist(reviews.basic_analysis$sent_score_basic, 
     main = "Sentiment Score for a Basic Analysis after Bing",
     col = "lightblue", 
     xlab = "Sentiment Score",
     xlim = c(-10, 10),
     breaks = seq(-50.5, 50.5, 1),
)
box()
dev.off()

# number of positive, neutral and negative reviews based on sentiment
num_all <- nrow(reviews.basic_analysis) # number of all reviews
print(paste0("Total number of reviews: ", num_all))
pos_num <- length(reviews.basic_analysis$sent_basic[reviews.basic_analysis$sent_basic == "positive"]) / num_all
neg_num <- length(reviews.basic_analysis$sent_basic[reviews.basic_analysis$sent_basic == "negative"]) / num_all
neu_num <- length(reviews.basic_analysis$sent_basic[reviews.basic_analysis$sent_basic == "neutral"]) / num_all
print(paste0("Share of positive, negative and neutral reviews: ", round(pos_num, 2), ", ", round(neg_num, 2), ", ", round(neu_num, 2)))

# number of positive and not positive reviews based on column "voted_up"
voted_pos <- length(reviews.basic_analysis$voted_up[reviews.basic_analysis$voted_up == TRUE]) / num_all
voted_neg <- length(reviews.basic_analysis$voted_up[reviews.basic_analysis$voted_up == FALSE]) / num_all
print(paste0("Share of positive and not positive reviews: ", round(voted_pos, 2), ", ", round(voted_neg, 2)))


# Time Evolution of Sentiment ----

# plot time development of basic and three syuzhet scores 
# filter out this one outlier
reviews.sentiment <- reviews.sentiment %>% filter(reviews.sentiment$sent_score_basic > -50)
# use only most recent reviews for better visualization
reviews.sentiment.short <- reviews.sentiment[8999+500:9998,]
# plot and save
png(paste0(path, "/../../03_report/graphs/", "time_ev_sent_scores.png"))
plot(reviews.sentiment.short$timestamp_created, reviews.sentiment.short$sent_score_basic,
     type = "l",
     col = "black",
     lty = 1,
     lwd = 2,
     xlab = "Days",
     ylab = "Sentiment Score",
     main = "Time Evolution of different Sentiment Scores",
     #ylim = c(-10, 20)
     )
lines(reviews.sentiment.short$timestamp_created, reviews.sentiment.short$sent_bing, col = "blue", lty = 1, lwd = 2, type = "l")
lines(reviews.sentiment.short$timestamp_created, reviews.sentiment.short$sent_afinn, col = "green", lty = 1, lwd = 2, type = "l")
lines(reviews.sentiment.short$timestamp_created, reviews.sentiment.short$sent_syuzhet, col = "red", lty = 1, lwd = 2, type = "l")
legend("topright", legend = c("Basic Bing", "Syuzhet Bing", "Syuzhet Afinn", "Syuzhet Syuzhett"), col = c("black", "blue", "green", "red"), lty = 1)
dev.off()

# helpfulness of sentiment score ----

# plot up votes against the basic sentiment score
# Remove rows with missing values in the specified columns
reviews.sentiment.short <- na.omit(reviews.sentiment.short[, c("sent_score_basic", "votes_up")])
# plot and save
png(paste0(path, "/../../03_report/graphs/", "up_votes_ev_basic_sent_scores.png"))
plot(reviews.sentiment.short$sent_score_basic, reviews.sentiment.short$votes_up, 
     col = "black",
     pch = "x",
     lty = 1,
     lwd = 2,
     xlab = "Sentiment Score",
     ylab = "Votes Up",
     main = "Basic Sentiment Score compared to Up Votes",
)
dev.off()
