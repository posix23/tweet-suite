### Page One
source("shiny_scripts/interact_one.R")
###
### Page Two
source("scripts/second-chart.R")
source("shiny_scripts/interact_two.R")
###

my_server <- function(input, output) {
  output$chart <- renderPlotly({ hashtag_vs_retweet(senators_df, input$size_range, input$party) })
  
  output$box_plot <- renderPlot({
    mood(sentimental_df, input$select, input$time)
  })
  
  output$box_para <- renderText({
    info_para(sentimental_df, input$select, input$time)
  })
}
