# Import required libraries
library(dplyr)

# Delete RStudio's table
rm(list = ls())

# This function will convert datetime to hour
convert_time <- function(datetime) {
  hour <- substr(datetime, 12, 13)
  hour <- as.numeric(hour)
  min <- substr(datetime, 15, 16)
  min <- as.numeric(min) / 60
  return(hour + min)
}

# Chart
# This function will return a box plot and the negative and positive mood's
# statistics
mood <- function(data_frame) {
  mood_df <- data_frame %>%
    mutate(time = convert_time(sentimental_df$date)) %>%
    select(target, time)
  boxplot(time ~ target, mood_df, main="How time affects mood",
          xlab="Mood (0 for negative mood and 4 for positive mood)",
          ylab="Hour of the day", las=1)
}

negative_mood_stats <- function(data_frame) {
  quantile(data_frame$time[data_frame$target == "0"],
                                probs=c(0, 0.25, 0.5, 0.75, 1))
}

positive_mood_stats <- function(data_frame) {
  quantile(data_frame$time[data_frame$target == "4"],
                                probs=c(0, 0.25, 0.5, 0.75, 1))
}