library("stringr")
library("dplyr")

# senators
get_senators_info <- function(dataset) {
  sum <- list()
  sum$length <- length(dataset)
  sum$average_reply <- mean(dataset$replies,na.rm = T)
  sum$largest_favorites <- max(dataset$favorites,na.rm = T)
  sum$smallest_retweets <- min(dataset$retweets, na.rm = T)
  sum$popular_party <- dataset %>% 
    group_by(party) %>% 
    summarise(summed_favorites = sum(favorites, na.rm = T)) %>%
    filter(summed_favorites == max(summed_favorites, na.rm = T)) %>%
    pull(party)
  return (sum)
}

# Russian


