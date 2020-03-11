source("scripts/third-chart.R")

russian_trolls <- read.csv("data/IRAhandle_tweets_1.csv", stringsAsFactors = F,
                           check.names = F)

page_four <- tabPanel(
  "Weekday",
  fluidPage(
    titlePanel("Most popular weekday to post to Twitter based on the users' region"),
    sidebarLayout(
      sidebarPanel(),
    )
  )
)