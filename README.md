# Tweet Suite Project Brainstorm
## Group members: Jasper Palmer, Toan Ly, Ruizhe Zhou, Nhat Le
## Github page: https://posix23.github.io/tweet-suite/

**Domain of Interest**

***Questions:***
- Why are you interested in this field/domain?
  - [Twitter](https://twitter.com/) is a highly popular social media platform that gives us an insight to individuals mindset through short text summaries called tweets. These individuals include influential public figures such as senators, as well as, any person that chooses to use the platform. This gives us data on social media usage in a standardized format that will allow us to draw conclusions about a wide variety of individuals. Twitter is also an optimal choice because it is a primarily text based allowing us to analyze information rather than missing a whole subsection of context such as Instagram’s focus on pictures.
  
- What other examples of data driven project have you found related to this domain?
  - We found [Emoji Trends](https://emoji.enricmor.eu/) a website that has analyzed the emojis used in 3,015,922,953 tweets since 2013.
  - We found [Which 2020 Candidates Have The Most In Common … On Twitter?](https://fivethirtyeight.com/features/which-2020-candidates-have-the-most-in-common-on-twitter/) a website that analyzed the 2020 candidates and how they compare in terms of their [Twitter](https://twitter.com/) data.
  - We found [The Worst Tweeter In Politics Isn’t Trump](https://fivethirtyeight.com/features/the-worst-tweeter-in-politics-isnt-trump/) a website thtat analyzed the likes, replies, and retweets of Donald Trumps against other politicians tweets to understand their reception.
  
- What data-driven questions do you hope to answer about this domain?

  - What is the most popular weekday to post to Twitter based on the users’ region?
    - Sources that contain this information are the Senators data since they are all from the United States, as well as, the Russian Troll data as it includes region as well as the text of a given tweet.
    
  - How does the number of hashtags in a tweet relate to the number of retweets it receives?
    - Sources that contain this information are the Senators data as it includes the number of retweets, as well as, the text of a given tweet.
    
  - How does the time of day effect the average users’ mood?
    - The source that contains this information is the Sentiment 140 which allows us to look at the polarity of a tweet and compare it to its time of publish.

**Finding Data:**

  ***Source 1***
  - Data URL:
    - Russian Troll Tweets: https://github.com/fivethirtyeight/russian-troll-tweets/blob/master/IRAhandle_tweets_1.csv
  - How the data were collected
    - Russian Troll Tweets: The data was collected by researchers Darren Linvill and Patrick Warren of Clemson University. They gathered the data using custom searches on a tool called Social Studio, owned by Salesforce and contracted for use by Clemson's Social Media Listening Center. 
  - Information about CSV
    - Russian Troll Tweets has 21 unique columns (external_author_id, author, content, region, language, publish_date, harvested_date, following, followers, updates, post_type, account_type, retweet, account_category, new_june_2018, alt_external_id, tweet_id, article_url, tco1_step1, tco2_step1, tco3_step1)
    -  We are only using the first data set which contains around 243892 troll tweets of Russians.
  - What data-driven questions do you hope to answer about this source?
    - What is the most popular weekday to post to Twitter based on the users’ region?
    - How does the number of hashtags in a tweet relate to the number of retweets it receives?
  
  ***Source 2***
  - Data URL:
     - Senators' Tweets: https://github.com/fivethirtyeight/data/blob/master/twitter-ratio/senators.csv
  - How the data were collected   
     - Senators' Tweet data was collected by researchers Oliver Roeder, Dhrumil Mehta, and Gus Wezerek, a group of journalists at FiveThirtyEight. The data records numerous tweets published by senators along with the senators' belonged parties and states, and information about number of replies, retweets, and favorites regarding the tweets. 
   - Information about CSV
     - There are 288615 rows in this dataset, which means a total number of 288615 tweets were published during this period. 
     - There are 10 columns in this dataset (created_at, text, url, replies, retweets, favorites, user, bioguide_id, party, state)
   - What data-driven questions do you hope to answer about this source?
     - What is the most popular weekday to post to Twitter based on the users’ region?
     - How does the number of hashtags in a tweet relate to the number of retweets it receives?
    
  ***Source 3***
  - Data URL:
    - 1.6 Million Tweets: https://www.kaggle.com/kazanova/sentiment140/data#
  - How the data were collected
    - A machine learning approach for automatically classifying the sentiment of Twitter messages. The sentiment was primarily classified based off emoticon data scraped by the official Twitter API. The data were collected by Alec Go, Richa Bhayani, and Lei Huang from Stanford University
  - Information about CSV
    - There are exactly 400000 rows in this dataset which were truncated from the original 1.6 million rows based on dates. We chose the date ranging from April 6th, 2009 to June 16th, 2009.
    - There are 6 columns in this dataset (target, ids, date, flag, user, text)
  - What data-driven questions do you hope to answer about this source
    - How does the time of day effect the average users’ mood?
