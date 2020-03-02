library("stringr")
library("dplyr")
library("knitr")

#summary table code for the first plot: the relationship between #of # and #of retweets for the senators dataset
hashtag_vs_retweet_table <- function(dataset) {
    dataset %>% 
    mutate(hashtags = str_count(text, "#")) %>%
    group_by(hashtags) %>%
    summarise(retweets = sum(retweets, na.rm = T), total_tweets = n()) %>%
    mutate(retweets_per_tweet = (retweets / total_tweets)) %>%
    select(hashtags, retweets_per_tweet) %>% 
    kable(col.names =c("Number of Hashtags","Average Number of Retweets"), align = "l")
}

region_numbertweets_table <- function(dataset){
  dataset %>% 
    filter(region != "" & region != "Unknown") %>%
    group_by(region) %>%
    summarize(n = n()) %>%
    select(region, n) %>% 
    kable(col.names =c("Regions","Number of Tweets"), align = "l")
}







# Remove list every time there is a rerun
rm(list = ls())

# Import all datasets
# senators_tweets <- read.csv("data/senators.csv", stringsAsFactors = FALSE)
#  russian_trolls <- read.csv("data/IRAhandle_tweets_1.csv",
#                           stringsAsFactors = FALSE)
# sentimental <- read.csv("data/sentimental140.csv", stringsAsFactors = FALSE)

# Summary table by number of tweets per region
# Russian troll tweets (Unknown and empty are filtered out)
  # into_the_unknown <- russian_trolls %>%
  #   filter(region != "" & region != "Unknown") %>%
  #   group_by(region) %>%
  #   summarize(n = n()) %>%
  #   select(region, n)

# Return the day of the week that appears the most based on region
  # get_most_day <- function(country) {
  #   return(
  #     russian_trolls %>%
  #       filter(region == country) %>%
  #       mutate(day = weekdays(as.POSIXct(publish_date, format="%m/%d/%Y"),
  #                             abbreviate = FALSE)) %>%
  #       group_by(day) %>%
  #       summarize(n = n()) %>%
  #       filter(n == max(n)) %>%
  #       select(day, n)
  #   )
#   # }
# 
# get_date_russian_trolls <- russian_trolls %>%
#   filter(region != "" & region != "Unknown") %>%
#   group_by(region) %>%
#   summarize(n = sapply(region, get_most_day)) %>%
#   select(region, day, n)
# 
# # Senators tweets
# senators <- senators_tweets %>%
#   mutate(region = "United States") %>%
#   group_by(region) %>%
#   summarize(n = n()) %>%
#   select(region, n)
