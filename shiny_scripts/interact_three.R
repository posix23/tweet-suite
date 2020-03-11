source("scripts/third-chart.R")

russian_trolls <- read.csv("data/IRAhandle_tweets_1.csv", stringsAsFactors = F,
                           check.names = F)

page_four <- tabPanel(
  "Weekday",
  fluidPage(
    h1("Most popular weekday to post to Twitter based on the users' region"),
    sidebarLayout(
      sidebarPanel(
        checkboxGroupInput("day_of_week", label = h3("Select day to remove"), 
                           choices = list(Friday = "Friday", Monday = "Monday", Saturday = "Saturday",
                                          Sunday = "Sunday", Thursday = "Thursday", Tuesday = "Tuesday", Wednesday = "Wednesday"),
                           selected =  c("Friday", "Monday", "Saturday", "Sunday", "Thursday", "Tuesday", "Wednesday")),
        sliderInput("donut_size", label = h3("Size Donut"), min = 0, 
                    max = 0.6, value = 0)
      ),
      mainPanel(
        plotlyOutput(outputId = "day_to_post")
      )
    )
  )
)