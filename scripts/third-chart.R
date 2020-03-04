#Import library
library("stringr")
library("dplyr")
library("plotly")

russian_trolls <- read.csv("../data/IRAhandle_tweets_1.csv", stringsAsFactors = F,
                           check.names = F)

#Remove unknown region in the dataset
filter_unknown_region <- function(dataset) {
  dataset %>%
    filter(region != "" & region != "Unknown")
}

russian_trolls <- filter_unknown_region(russian_trolls)

#Convert date to day in week (like 16-08-2012 = Tuesday)
convert_day <- function(dataset, date_collumn) {
  mutate(dataset, date = weekdays(as.Date(word(dataset[[date_collumn]], 1), "%m/%d/%Y"), 
                                  abbreviate = FALSE))
}

russian_trolls <- convert_day(russian_trolls, "publish_date")

#Calculate the frequency of date in both dataset
date_freq_russian_trolls <- table(russian_trolls$region, russian_trolls$date)
date_frequency <- data.frame(rbind(date_freq_russian_trolls))
date_frequency <- data.frame(t(date_frequency))
date_frequency$tweet_frequency <- rowSums(date_frequency[,-16])
date_frequency <- subset(date_frequency, select = c("tweet_frequency"))
date_frequency <- t(date_frequency)
row.names(date_frequency) <- NULL
lbls <- c("Friday", "Monday", "Saturday", "Sunday", "Thursday", "Tuesday", "Wednesday")
pie(date_frequency, labels = lbls, main = "Most popular weekday to post to Twitter")

