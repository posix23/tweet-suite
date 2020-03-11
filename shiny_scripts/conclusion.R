page_five <- tabPanel(
  "Conclusion", 
  fluidPage(
    h1("Conclusion"),
    br(),
    h2("Does Mood Change Throughout the Day?"),
    p(""),
    br(),
    h2("Are Hashtags Effective?"),
    p("The second notable data-driven insight that we discovered, was that 
      hashtags have an overall negative impact on the retweets of an individual 
      tweet. While this was just based on U.S. senators, when split up by party 
      affiliations the overall trend remained the same." ),
    br(),
    tableOutput(outputId = "hashtags_table"),
    p("This insight, while not guaranteed to be accurate for personal use, can 
      be applicable to any individual who would like to use twitter in a manner 
      that increases the number of retweets that they receive. This can be 
      applied to any individual who wants to gain more traction on the 
      platform as well as a smaller subset of individuals that are looking to 
      become twitter famous. This insight is also interesting because ti may be 
      contradictory to intuition as one may assume that hashtags function as 
      intended to increase visibility and promote growth for the tweets that 
      incorporate them."),
    br(),
    h2("Is There a Best Day to Tweet?"),
    p("")
  )
)
    