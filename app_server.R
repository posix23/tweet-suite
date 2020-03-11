### Page Two
source("scripts/second-chart.R")
source("shiny_scripts/interact_two.R")

### Page Three
source("shiny_scripts/interact_one.R")

## Page Four
source("scripts/third-chart.R")
source("shiny_scripts/interact_three.r")
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
  
  output$box_plot <- renderPlotly({
    mood(sentimental_df, input$select, input$time)
  })
  
  output$box_para <- renderText({
    info_para(sentimental_df, input$select, input$time)
  })
  
  output$median <- renderText({
    paste0(rebuild_datetime(get_median(sentimental_df, "4", c(0, 24))), " and ",
           rebuild_datetime(get_median(sentimental_df, "0", c(0, 24))))
  })
  
  output$hashtags_table <- renderTable({hashtag_vs_retweet_table(senators_df)})
}
