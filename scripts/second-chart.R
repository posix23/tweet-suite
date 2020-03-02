# Import required libraries
library(dplyr)

# Delete RStudio's table
rm(list = ls())

# Import CSV file
sentimental_df <- read.csv("data/sentimental140.csv", stringsAsFactor = FALSE)

# This function will convert datetime to hour
convert_time <- function(datetime) {
  hour <- substr(datetime, 12, 13)
  hour <- as.numeric(hour)
  min <- substr(datetime, 15, 16)
  min <- as.numeric(min) / 60
  return(hour + min)
}

# Chart
# Data
mood <- sentimental_df %>%
  mutate(time = convert_time(sentimental_df$date)) %>%
  select(target, time)

# Create chart
box_plot <- boxplot(time ~ target, mood, main="How time affects mood",
                    xlab="Mood (0 for negative mood and 4 for positive mood)",
                    ylab="Hour of the day", las=1)

# Statistics
negative_mood_stats <- quantile(mood$time[mood$target == "0"],
                                probs=c(0, 0.25, 0.5, 0.75, 1))
positive_mood_stats <- quantile(mood$time[mood$target == "4"],
                                probs=c(0, 0.25, 0.5, 0.75, 1))
