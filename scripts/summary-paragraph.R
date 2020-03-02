library("stringr")
library("dplyr")

# meaningful information about the senators dataset
get_senators_info <- function(dataset) {
  sum <- list()
  sum$length <- length(dataset)
  sum$average_reply <- mean(dataset$replies, na.rm = T)
  sum$largest_favorites <- max(dataset$favorites, na.rm = T)
  sum$fewest_favorites <- min(dataset$favorites, na.rm = T)
  sum$largest_retweets <- max(dataset$retweets, na.rm = T)
  sum$fewest_retweets <- min(dataset$retweets, na.rm = T)
  sum$popular_party <- dataset %>%
    group_by(party) %>%
    summarise(summed_favorites = sum(favorites, na.rm = T)) %>%
    filter(summed_favorites == max(summed_favorites, na.rm = T)) %>%
    pull(party)
  return(sum)
}

# meaningful information about the russian trolls dataset
get_russian_info <- function(dataset) {
  sum <- list()
  sum$length <- length(dataset)
  sum$average_num_followers <- mean(dataset$followers, na.rm = T)
  sum$average_num_following <- mean(dataset$following, na.rm = T)
  sum$fewest_followers <- min(dataset$followers, na.rm = T)
  sum$max_followers <- max(dataset$followers, na.rm = T)
  sum$good_writer <- dataset %>%
    group_by(author) %>%
    summarize(number = n()) %>%
    filter(number == max(number, na.rm = T)) %>%
    pull(author)
  return(sum)
}

# meaningful information about the sentimental dataset
get_sentimental_info <- function(dataset) {
  sum <- list()
  sum$length <- length(dataset)
  sum$column_name <- colnames(dataset)
  sum$total_positive <- pull(dataset %>%
    filter(dataset$target == 4) %>%
    summarize(number = n()) %>%
    select(number))
  sum$total_negative <- pull(dataset %>%
    filter(dataset$target == 0) %>%
    summarize(number = n()) %>%
    select(number))
  sum$most_prefered_day <- pull(dataset %>%
    mutate(whichday = substr(date, 1, 3)) %>%
    group_by(whichday) %>%
    summarise(number = n()) %>%
    filter(number == max(number, na.rm = T)) %>%
    select(whichday))
  sum$least_prefered_day <- pull(dataset %>%
    mutate(whichday = substr(date, 1, 3)) %>%
    group_by(whichday) %>%
    summarise(number = n()) %>%
    filter(number == min(number, na.rm = T)) %>%
    select(whichday))
  return(sum)
}
