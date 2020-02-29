library("stringr")
library("dplyr")
library("plotly")

hashtag_vs_retweet <- function(dataframe) {
  processed_df <- mutate(dataframe, hashtags = str_count(text, "#")) %>%
    group_by(hashtags) %>%
    summarise(retweets = sum(retweets, na.rm = T), total_tweets = n()) %>%
    mutate(retweets_per_tweet = (retweets / total_tweets)) %>%
    select(hashtags, retweets_per_tweet)
    plot_ly(
      data = processed_df,
      x = ~ hashtags,
      y = ~ retweets_per_tweet,
      type = "scatter",
      marker = list(size = 10,
                    color = 'rgba(255, 182, 193, .9)',
                    line = list(color = 'rgba(152, 0, 0, .8)',
                                width = 2)),
      text = ~paste("Hashtags: ", hashtags, "<br>Average Retweets:", round(retweets_per_tweet, digits = 0)),
      showlegend = F
    ) %>%
      layout(
        title = "Number Retweets per Hashtag for American Senators",
        xaxis = list(title = "Number of Hashtags", zeroline = F),
        yaxis = list(title = "Average Number of Retweets", zeroline = F)
     ) %>%
    add_trace(y = ~ retweets_per_tweet, name = '', mode = 'lines')
}

# russian_troll_df <- read.csv("data/IRAhandle_tweets_1.csv")


