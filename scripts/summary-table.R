library("stringr")
library("dplyr")
library("knitr")

# summary table code for the first plot: the relationship
# between #of # and #of retweets for the senators dataset
hashtag_vs_retweet_table <- function(dataset) {
  dataset %>%
    mutate(hashtags = str_count(text, "#")) %>%
    group_by(hashtags) %>%
    summarise(retweets = sum(retweets, na.rm = T), total_tweets = n()) %>%
    mutate(retweets_per_tweet = (retweets / total_tweets)) %>%
    select(hashtags, retweets_per_tweet) %>%
    kable(col.names = c(
      "Number of Hashtags",
      "Average Number of Retweets"
    ), align = "l")
}

# summary table code for the regions & numbers plot
region_numbertweets_table <- function(dataset) {
  dataset %>%
    filter(region != "" & region != "Unknown") %>%
    group_by(region) %>%
    summarize(number = n()) %>%
    arrange(desc(number)) %>%
    select(region, number) %>%
    kable(col.names = c("Regions", "Number of Tweets"), align = "l")
}

# summary table code for the mood & date plot
sentimental_table <- function(dataset) {
  dataset %>%
    mutate(Positive = target == 4) %>%
    count(target == 4)
}
