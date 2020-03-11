# Import required libraries
library("dplyr")
library("plotly")

# This function will convert datetime to hour (12:30:34 -> 12.5)
convert_time <- function(datetime) {
  hour <- substr(datetime, 12, 13)
  hour <- as.numeric(hour)
  min <- substr(datetime, 15, 16)
  min <- as.numeric(min) / 60
  return(hour + min)
}

# Return a new data frane that contains the mood and hour in a day
create_mood_df <- function(dataframe, slider_input) {
  dataframe %>%
    mutate(time = convert_time(dataframe$date)) %>%
    filter(time > slider_input[1], time < slider_input[2]) %>%
    select(target, time)
}

# Chart
# This function will return a box plot with the user's input
mood <- function(dataframe, drop_down_input, slider_input) {
  mood_df <- create_mood_df(dataframe, slider_input)
  title <- "How time affects mood"
  x_label <- "Mood (0 for negative mood and 4 for positive mood)"

  if (drop_down_input == "2") {
    mood_df <- mood_df %>% filter(target == "4")
    title <- "How time affects positive mood"
    x_label <- "Positive mood"
  } else if (drop_down_input == "3") {
    mood_df <- mood_df %>% filter(target == "0")
    title <- "How time affects negative mood"
    x_label <- "Negative mood"
  }

  plot_ly(
    data = mood_df,
    x = ~target,
    y = ~time,
    type = "box",
    alpha = 0.7
  ) %>%
    layout(
      title = title,
      xaxis = list(title = x_label),
      yaxis = list(title = "Time"),
      margin = 25
    )
}

# Get the median for the data frame
get_median <- function(dataframe, mood_number, slider_input) {
  mood_df <- create_mood_df(dataframe, slider_input)
  median(mood_df$time[mood_df$target == mood_number])
}

# Rebuild datetime from hour (12.5 -> 12:30)
rebuild_datetime <- function(hour) {
  start_min <- 3
  end_hour <- 2
  if (hour < 10) {
    start_min <- 2
    end_hour <- 1
  }
  min <- round(as.numeric(paste0(
    "0",
    substr(hour, start_min, nchar(hour))
  )) * 60,
  digits = 0
  )
  hour <- substr(hour, 1, end_hour)
  if (min < 10) {
    min <- paste0("0", min)
  }
  paste0(hour, ":", min)
}

# This function will update the info paragraph based on the user's input
info_para <- function(dataframe, drop_down_input, slider_input) {
  para <- "The box plot for negative mood is skewed to the later time in
    the day which could indicate that due to a long work day or school day,
    people tend to be in a negative mood. The opposite is expected for positive
    mood as people are just freshed out of bed."

  if (drop_down_input == "2") {
    para <- paste0(
      "The median of the positive plot (with a range from ",
      slider_input[1], " to ", slider_input[2], ") is at hour ",
      get_median(dataframe, "4", slider_input), " (",
      rebuild_datetime(get_median(
        dataframe, "4",
        slider_input
      )), ")"
    )
  } else if (drop_down_input == "3") {
    para <- paste0(
      "The median of the negative plot (with a range from ",
      slider_input[1], " to ", slider_input[2], ") is at hour ",
      get_median(dataframe, "0", slider_input), " (",
      rebuild_datetime(get_median(
        dataframe, "0",
        slider_input
      )), ")"
    )
  }

  return(para)
}
