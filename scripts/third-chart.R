# Import library
library("stringr")
library("dplyr")
library("plotly")

# Remove unknown region in the dataset
filter_unknown_region <- function(dataset) {
  dataset %>%
    filter(region != "" & region != "Unknown")
}
# Convert date to day in week (like 16-08-2012 = Tuesday)
convert_day <- function(dataset, date_collumn) {
  mutate(dataset,
    date = weekdays(as.Date(word(dataset[[date_collumn]], 1), "%m/%d/%Y"),
      abbreviate = FALSE
    )
  )
}

# create a pie chart
create_pie_chart <- function(russian_trolls, input_date, input_donut) {
  russian_trolls <- convert_day(russian_trolls, "publish_date")
  russian_trolls <- filter_unknown_region(russian_trolls)
  date_freq_russian_trolls <- table(russian_trolls$region, russian_trolls$date)
  date_frequency <- data.frame(rbind(date_freq_russian_trolls))
  date_frequency <- data.frame(t(date_frequency))
  date_frequency$tweet_frequency <- rowSums(date_frequency[, -16])
  date_frequency <- subset(date_frequency, select = c("tweet_frequency"))
  date_frequency$day <- c(
    "Friday", "Monday", "Saturday", "Sunday", "Thursday",
    "Tuesday", "Wednesday"
  )
  row.names(date_frequency) <- NULL
  date_frequency <- subset(date_frequency, date_frequency$day %in% input_date)
  fig <- plot_ly(date_frequency, labels = ~day, values = ~tweet_frequency) %>%
    add_pie(hole = as.numeric(input_donut)) %>%
    layout(
      title = "Most popular weekday to post to Twitter",
      xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
      yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE)
    )
}

create_weekday_df <- function(russian_trolls) {
  russian_trolls <- convert_day(russian_trolls, "publish_date")
  russian_trolls <- filter_unknown_region(russian_trolls)
  date_freq_russian_trolls <- table(russian_trolls$region, russian_trolls$date)
  date_frequency <- data.frame(rbind(date_freq_russian_trolls))
  date_frequency <- data.frame(t(date_frequency))
  date_frequency$tweet_frequency <- rowSums(date_frequency[, -16])
  date_frequency <- subset(date_frequency, select = c("tweet_frequency"))
  date_frequency$day <- c(
    "Friday", "Monday", "Saturday", "Sunday", "Thursday",
    "Tuesday", "Wednesday"
  )
  row.names(date_frequency) <- NULL
}