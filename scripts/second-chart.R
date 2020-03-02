# Import required libraries
library("dplyr")

# This function will convert datetime to hour
convert_time <- function(datetime) {
  hour <- substr(datetime, 12, 13)
  hour <- as.numeric(hour)
  min <- substr(datetime, 15, 16)
  min <- as.numeric(min) / 60
  return(hour + min)
}

# Return a new data frane that contains the mood and hour in a day
create_new_df <- function(dataframe) {
  dataframe %>%
    mutate(time = convert_time(dataframe$date)) %>%
    select(target, time)
}

# Chart
# This function will return the statistics for the negative plot
stats_negative <- function(dataframe) {
  mood_df <- create_new_df(dataframe)
  quantile(mood_df$time[mood_df$target == "0"],
           probs=c(0, 0.25, 0.5, 0.75, 1))
}

# This function will return the statistics for the positive plot
stats_positive <- function(dataframe) {
  mood_df <- create_new_df(dataframe)
  quantile(mood_df$time[mood_df$target == "4"],
           probs=c(0, 0.25, 0.5, 0.75, 1))
}

# This function will return a box plot
mood <- function(dataframe) {
  mood_df <- create_new_df(dataframe)
  boxplot(time ~ target, mood_df, main="How time affects mood",
          xlab="Mood (0 for negative mood and 4 for positive mood)",
          ylab="Hour of the day", las=1)
}