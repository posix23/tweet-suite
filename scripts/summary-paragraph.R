russian_troll_df <- read.csv("data/IRAhandle_tweets_1.csv")
# A function that takes in a dataset and returns a list of info about it:
russian_troll_info <- function(df) {
  rus <- list()
  rus$length <- length(df)
  # do some more interesting stuff
  return (rus)
} 
russian_info <- russian_troll_info(russian_troll_df)
