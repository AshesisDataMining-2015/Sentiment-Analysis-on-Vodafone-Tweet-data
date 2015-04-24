#Author: Chloe Acheampong
#Date: 24/04/2015

setwd("C:/Users/USER/Google Drive/Ashesi University College/Senior/Year 4 sem2/Data Mining/vodafone_tweets")
list.files()
library(twitteR)
library(wordcloud)
library(RColorBrewer)
library(plyr)
library(ggplot2) 
library(sentiment) 
oauth_endpoints("twitter")
#<oauth_endpoint>
 #request:   https://api.twitter.com/oauth/request_token
 #authorize: https://api.twitter.com/oauth/authenticate
 #access:    https://api.twitter.com/oauth/access_token
api_key <- "mCLt7xfm8vpTMpCXkArbvI2QC"
api_secret <- "H3XHwHYNByuxXNhUfoEgnh7rcnN9JMvk17Tx83TxBlbR2Hgjvw"
access_token <- "1151329542-ap8JSJNZyz0HJN3biqB722rxY90AU7GaQY7AUaw"
access_token_secret <- "Icl22Umbwce4hcdArPqTkOUOqdAKkrR5Xftnve3m5sE2O"
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)
v_tweets = searchTwitter("vodafone ghana", n=2000, lang="en")
#v_tweets = searchTwitter("MTN ghana", n=2000, lang="en")
#v_tweets = searchTwitter("Tigo ghana", n=2000, lang="en")

