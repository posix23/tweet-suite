library("stringr")
library("dplyr")
library("plotly")

hashtag_vs_retweet <- function(dataframe, input_hashtag_number, input_party) {
  processed_df <- mutate(dataframe, hashtags = str_count(text, "#")) %>%
    filter(party == input_party) %>%
    group_by(hashtags) %>%
    summarise(retweets = sum(retweets, na.rm = T), total_tweets = n()) %>%
    mutate(retweets_per_tweet = (retweets / total_tweets)) %>%
    select(hashtags, retweets_per_tweet) %>%
    filter(hashtags >= input_hashtag_number[1] & hashtags <=
             input_hashtag_number[2])

  plot_ly(
    data = processed_df,
    x = ~hashtags,
    y = ~retweets_per_tweet,
    type = "bar",
    text = ~ paste(
      "Hashtags: ", hashtags, "<br>Average Retweets:",
      round(retweets_per_tweet, digits = 0)
    ),
    showlegend = F
  ) %>%
    layout(
      title = "Number Retweets per Hashtag for American Senators",
      xaxis = list(title = "Number of Hashtags", zeroline = F),
      yaxis = list(title = "Average Number of Retweets", zeroline = F),
      margin = 25
    )
}
