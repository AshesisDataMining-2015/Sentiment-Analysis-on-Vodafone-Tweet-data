# Sentiment-Analysis-on-Vodafone-Tweet-data

###Aim:

Analyzing the tweets on Vodafone to classify their tweets into positive, negative, and neutral, in order to help determine their performance in the global market 


##Dataset:
The vodafone tweet dataset was obtained using R studio. Libraries like twitteR, sentiment, Rstem, plyr, among others were used to obtain this data. 
Below are the links to how the packages and tweet data were obtained:
https://mkmanu.wordpress.com/2014/08/05/sentiment-analysis-on-twitter-data-text-analytics-tutorial/

Downloading sentiment package:
1. Package:  http://cran.r-project.org/src/contrib/Archive/sentiment/
2. Install using:  install.packages(file_name_and_path, repos = NULL, type="source")


Since I compared Vodafone to other Telcos in Ghana for better assessment, I included the dataset for MTN and Tigo. In the project repository, you would find three major datasets:
  Vodafone: vodafone.txt
  MTN: mtn.txt
  Tigo: tigo.txt

Also, in order to make the data more skewed towards the Ghanaian market, I downloaded tweets that had both Ghana and the name of the Telco. For example "vodafone ghana", "mtn ghana". These Ghanaina tweets were replaced with 98 tweets of the           previously downloaded to tweets before processing. 

In each of the tweet data, there were 2000 unprocessed tweets for each of the Telcos that contained the name of the subject Telco in them. However to make it easy to evalutate these tweets semantically, the following  preprocessing steps had to be taken to clean the data. These included:
  Punctuations
  Digits
  Unneccessary whitespaces and tabs
  Removing retweets
  HTML links
  Empty lines
  

##Research Question:
    How do I assess the performanance of Vodafone in the market using the obtained tweets?


##Analysis programmed:
  -The commands.r file contains the code to extract the tweet data from Twitter. 
  -The main.r file contains the main code to clean the data and classify the tweets.


##Presentation graphics:
  The graphics/ folder contains the results obtained from this project.
  
  
##Presentation deck:
  The slides for my presentation is in a file called "Sentiment Analysis on Vodafone tweets.ppx"

 
