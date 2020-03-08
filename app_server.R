source("shiny_scripts/interact_one.R")
my_server <- function(input, output) {
  output$chart <- renderPlotly({ hashtag_vs_retweet(senators_df, input$size_range, input$party) })
}
