
source("scripts/first-chart.R")

senators_df <- read.csv("data/senators.csv", stringsAsFactors = F,
                        check.names = F)

page_three <- tabPanel(
  "Hashtags", 
  fluidPage(h1("Hashtags Vs. Retweets"), 
    h2("Does the Number of Hashtags on a Tweet Effect its Number of Retweets?"),
    br(),
    sidebarLayout(
      sidebarPanel(
        sliderInput(
          "size_range",
          label = "Number of Hashtags to Compare",
          min = 0, 
          max = 9,
          value = c(0, 9)
        ),
        selectInput(
          "party", 
          label = "Party of Senators :", 
          choices = list(
            Republican = "R",
            Democrat = "D",
            Independent = "I"
          ), 
          selected = "poptotal")
      ),
      mainPanel(
        plotlyOutput(outputId = "chart")
      )
    ),
    br(),
    p(
      "As we can see from the chart, the overall trend (excluding the outlier of eight
      hashtags) is a significant decline in average number of retweets per tweet for
      each hashtag used a U.S. Senator's post. This trend is not consistent with the 
      number of retweets for the eight hashtag tweets, however, there were only six
      tweets with eight hashtags and one tweet happened to have thousands of retweets 
      which heavily skewed its average result. Another interesting observation is that 
      when there were no hashtags in a tweet it received a much higher number of 
      average retweets and that by adding even one hashtag to a senator’s tweet it 
      greatly decreases their average number of retweets. This is interesting because 
      hashtags are intended to increase visibility and promote awareness, however, in 
      this small sample we see the opposite trend of decreased exposure that could be
      attributed to a variety of outside factors."
    )
  )
)

