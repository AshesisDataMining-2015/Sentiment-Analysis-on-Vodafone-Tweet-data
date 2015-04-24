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

v_corpus = sapply(v_tweets, function(x) x$getText())
# removing retweets from the data
v_corpus = gsub("(RT|via))((?:\\b\\W*@\\w+)+)","",v_corpus)
# removing all "@mannies" from  the data
v_corpus = gsub("@\\w+","",v_corpus)
#removing all punctuations
v_corpus = gsub("[[:punct:]]","",v_corpus)
#removing all digits in the data
v_corpus = gsub("[[:digit:]]","",v_corpus)
#removing all html links, that are not needed for sentiment analysis
v_corpus = gsub("http\\w+","",v_corpus)
# removing all unneccessary whitespace, tabs
v_corpus = gsub("[ \t]{2,}","",v_corpus)
v_corpus = gsub("^\\s+|\\s+$","",v_corpus)