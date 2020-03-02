library("stringr")
library("dplyr")
senators_df <- read.csv("data/senators.csv")

# A function that takes in a dataset and returns a list of info about it:
hashtag_vs_retweet_info <- function() {
  senators_df %>% 
  sen <- list() %>% 
  sen$length <- length(senators_df) %>% 
  return (sen)
} 

