#Import library
library("stringr")
library("dplyr")
library("plotly")
library("plyr")

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

#Create a dataset containing tweets in weekdays in each region
russian_trolls <- convert_day(russian_trolls, "publish_date")
date_freq_russian_trolls <- table(russian_trolls$region, russian_trolls$date)
