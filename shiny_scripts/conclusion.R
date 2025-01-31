page_five <- tabPanel(
  "Conclusion",
  fluidPage(
    h1("Conclusion"),
    br(),
    h2("Does Mood Change Throughout the Day?"),
    p("The median time of the day for positive mood tweets and negative mood
      respectively:"),
    textOutput("median"),
    p("This indicates that due to a long work day or school day, people tend to
      be in a negative mood due to exhaustion or stress and most get into
      negative mood at around lunch time. The opposite is expected for the
      positive mood because people just get up and still have a lot of
      energy."),
    br(),
    h2("Are Hashtags Effective?"),
    p("The second notable data-driven insight that we discovered, was that
      hashtags have an overall negative impact on the retweets of an individual
      tweet. While this was just based on U.S. senators, when split up by party
      affiliations the overall trend remained the same."),
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
    p("This table shows each of the days of the week as their tweet frequency
      (which day is irrelevant) in order to illustrate that each day of the week
      has approximately the same value of tweet frequency"),
    br(),
    tableOutput(outputId = "weekday_table"),
    p("There is no particular favourite day for people to Tweet. Based on our
    data, we can see that the number of tweets in each day
      day of week is quite the same and evenly distributed. For example, the
      number of Tweets in Friday takes up 16% the total number of
      tweets and the number of Tweets in Wednesday takes up 15%. Since the data
      is evenly distributed, we can tell that access to
      Twitter nowdays is greatly made easier through mobile phones and other
      electronic devices so people can post their tweet anywhere
      and anytime they want to with little to no difficulties.")
  )
)
