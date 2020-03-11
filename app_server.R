### Page Two
source("scripts/second-chart.R")
source("shiny_scripts/interact_two.R")

### Page Three
source("shiny_scripts/interact_one.R")

## Page Four

## Conclusion
source("scripts/summary-table.R")



my_server <- function(input, output) {
  output$chart <- renderPlotly({ 
    hashtag_vs_retweet(
      senators_df,
      input$size_range, 
      input$party
    ) 
  })
  
  output$box_plot <- renderPlot({
    mood(sentimental_df, input$select, input$time)
  })
  
  output$box_para <- renderText({
    info_para(sentimental_df, input$select, input$time)
  })
  
  output$hashtags_table <- renderTable({hashtag_vs_retweet_table(senators_df)})
}
