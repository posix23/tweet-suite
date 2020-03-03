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
create_mood_df <- function(dataframe) {
  dataframe %>%
    mutate(time = convert_time(dataframe$date)) %>%
    select(target, time)
}

# Chart
# This function will return the statistics for the box plot
stats_mood <- function(dataframe, mood_number) {
  mood_df <- create_mood_df(dataframe)
  quantile(mood_df$time[mood_df$target == mood_number],
           probs=c(0, 0.25, 0.5, 0.75, 1))
}

# This function will return a box plot
mood <- function(dataframe) {
  mood_df <- create_mood_df(dataframe)
  boxplot(time ~ target, mood_df, main="How time affects mood",
          xlab="Mood (0 for negative mood and 4 for positive mood)",
          ylab="Hour of the day", las=1)
}

# Get the median for the data frame
get_median <- function(dataframe, mood_number) {
  mood_df <- create_mood_df(dataframe)
  median(mood_df$time[mood_df$target == mood_number])
}

# Rebuild datetime from hour
rebuild_datetime <- function(hour) {
  min <- as.numeric(paste0("0", substr(hour, 3, nchar(hour)))) * 60
  hour <- substr(hour, 1, 2)
  paste0(hour, ":", round(min, digits = 0))
}
