source("scripts/second-chart.R")

sentimental_df <- read.csv("data/sentimental140.csv", stringsAsFactors = F,
                           check.names = F)

page_two <- tabPanel(
  "Mood",
  fluidPage(
    # Application title
    titlePanel("Time of the day vs. Mood"),

    h2("Does the time of the day affect the mood of the Twitter user?"),

    p("The box plot could be used to find the relationship between the time of
      the day and the Twitter user mood by comparing the statistics between
      the positive and negative moods."),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
      sidebarPanel(
        sliderInput("time",
                    "Select the range of time of the day:",
                    min = 0,
                    max = 24,
                    value = c(0, 24)),

        selectInput(inputId = "select",
                    label = h3("Select the population you want to show in the
                               plot"),
                    choices = list("Both graphs" = 1,
                                   "Positive mood" = 2,
                                   "Negative mood" = 3), selected = 1)
      ),

      # Show a plot of the generated distribution
      mainPanel(
        plotOutput("box_plot"),
        br(),
        textOutput("box_para")
      )
    )
  )
)
