
page_one <- tabPanel(
  "Introduction",
  fluidPage(
    h1("Shared Tweets: An Analysis of Global Twitter Data"),

    strong("Presented by"),
    p("Jasper Palmer, Toan Ly, Ruizhe Zhou, and Nhat Le"),

    h2("Background Introduction"),
    p(
      "The domain that we are focusing on is", strong("Twitter data"), "as it is
      a highly popular social media platform that gives us an insight to
      individuals
  mindset through short text summaries called", strong("tweets"), ". These
  individuals include influential public figures such as", strong("senators"),
      "as well as", strong("any person"), "that chooses to use the platform.
      This
  gives us data on social media usage in a standardized format that will allow
  us to draw conclusions about a wide variety of individuals. Twitter is also an
  optimal choice because it is a primarily", strong("text based"), "allowing us
  to analyze information rather than missing a whole subsection of context such
  as Instagram’s focus on pictures."
    ),

    h2("Research Questions"),
    strong("1. What is the most popular weekday to post to Twitter based on the
         users’ region?"),
    p("Sources that contain this information are the Senators data since they
    are
    all from the United States, as well as, the Russian Troll data as it
    includes region as well as the text of a given tweet."),
    strong("2. How does the number of hashtags in a tweet relate to the number
    of
         retweets it receives?"),
    p("Sources that contain this information are the Senators data as it
    includes
    the number of retweets, as well as, the text of a given tweet."),
    strong("3. How does the time of day effect the average users’ mood?"),
    p("The source that contains this information is the Sentiment 140 which
    allows
    us to look at the polarity of a tweet and compare it to its time
    of publish."),
    img("",
      src = "https://media.sproutsocial.com/uploads/2019/08/twitter-stats.svg",
      align = "center"
    ),
    h2("Datasets Info"),
    strong("1. Russian Troll Tweets:"), a("link",
      href =
        "https://github.com/fivethirtyeight/russian-troll-tweets/blob/master/
IRAhandle_tweets_1.csv"
    ),
    p("This dataset was collected by researchers Oliver Roeder, Dhrumil Mehta,
    and Gus Wezerek, a group of journalists at FiveThirtyEight. The data records
    numerous tweets published by senators along with the senators' belonged
    parties and states, and information about number of replies, retweets, and
    favorites regarding the tweets."),
    strong("2. Senators' Tweets:"), a("link",
      href =
"https://github.com/fivethirtyeight/data/blob/master/twitter-ratio/senators.csv"
    ),
    p("Senators' Tweet data was collected by researchers Oliver Roeder, Dhrumil
    Mehta, and Gus Wezerek, a group of journalists at FiveThirtyEight. The data
    records numerous tweets published by senators along with the senators'
    belonged parties and states, and information about number of replies,
    retweets, and favorites regarding the tweets."),
    strong("3. 1.6 Million Tweets:"), a("link",
      href =
        "https://www.kaggle.com/kazanova/sentiment140/data#"
    ),
    p("A machine learning approach for automatically classifying the sentiment
    of
    Twitter messages. The sentiment was primarily classified based off emoticon
    data scraped by the official Twitter API. The data were collected by Alec
    Go, Richa Bhayani, and Lei Huang from Stanford University.")
  )
)
