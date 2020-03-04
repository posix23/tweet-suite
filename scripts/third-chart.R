#Import library
library("stringr")
library("dplyr")
library("plotly")
#Remove unknown region in the dataset
filter_unknown_region <- function(dataset) {
  dataset %>%
    filter(region != "" & region != "Unknown")
}
#Convert date to day in week (like 16-08-2012 = Tuesday)
convert_day <- function(dataset, date_collumn) {
  mutate(dataset, date = weekdays(as.Date(word(dataset[[date_collumn]], 1), "%m/%d/%Y"), 
                                  abbreviate = FALSE))
}
#create a pie chart
create_pie_chart <- function(dataset) {
  date_freq_russian_trolls <- table(dataset$region, dataset$date)
  date_frequency <- data.frame(rbind(date_freq_russian_trolls))
  date_frequency <- data.frame(t(date_frequency))
  date_frequency$tweet_frequency <- rowSums(date_frequency[,-16])
  date_frequency <- subset(date_frequency, select = c("tweet_frequency"))
  date_frequency <- t(date_frequency)
  row.names(date_frequency) <- NULL
  lbls <- c("Friday", "Monday", "Saturday", "Sunday", "Thursday", "Tuesday", "Wednesday")
  pct <- round(date_frequency/sum(date_frequency)*100)
  lbls <- paste(lbls, pct) # add percents to labels
  lbls <- paste(lbls,"%",sep = "") # ad % to labels
  pie(date_frequency, labels = lbls, main = "Most popular weekday to post to Twitter")
}

