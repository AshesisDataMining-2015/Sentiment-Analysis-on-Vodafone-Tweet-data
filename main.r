#Author: Chloe Acheampong
#Date: 24/04/2015
setwd("C:/Users/USER/Google Drive/Ashesi University College/Senior/Year 4 sem2/Data Mining/vodafone_tweets")

#loading libraries...
library(twitteR)
library(wordcloud)
library(RColorBrewer)
library(plyr)
library(ggplot2)
library(tm)
library(NLP)
library(Rstem) 
library(sentiment)

tweet = file("vodafone.txt",open="r")
tweets = readLines(tweet)
close(tweet)
# removing retweets from the data
v_corpus = gsub("(RT|via))((?:\\b\\W*@\\w+)+)","",tweets)

#removing all digits in the data
v_corpus = gsub("[[:digit:]]","",v_corpus)

#removing all html links, that are not needed for sentiment analysis
v_corpus = gsub("http\\w+","",v_corpus)

# removing all "@mannies" from  the data
v_corpus = gsub("@\\w+","",v_corpus)

#removing all punctuations
v_corpus = gsub("[[:punct:]]","",v_corpus)

#removing all empty lines 
v_corpus <- v_corpus[sapply(v_corpus, nchar) > 0]
v_corpus = v_corpus[1:2000]

# removing all unneccessary whitespace, tabs
v_corpus = gsub("[ \t]{2,}"," ",v_corpus)
v_corpus = gsub("^\\s+|\\s+$","",v_corpus)

#convert to lower case 
v_corpus = tolower(c(v_corpus))

# removing all unnecessary in the tweet
v_corpus = v_corpus[!is.na(v_corpus)]

 #removing all stopwords
v_corpus = removeWords(v_corpus, stopwords("english"))

#classfying tweets into pos, neg, neutral(pos/neg), best fit
classify_polarity(?classify_polarity)
tweet_class = classify_polarity(v_corpus, algorithm="Bayes")
polarity =tweet_class[,4]

classify_emotion(?classify_emotion)
tweet_emo = classify_emotion(v_corpus,algorithm="bayes", prior=1.0)
emotion = tweet_emo[,7]
emotion[is.na(emotion)]= "unknown"

sent_frame = data.frame(text=v_corpus, emotion=emotion, polarity=polarity, stringsAsFactors=FALSE)
sent_frame = within(sent_frame, emotion <-factor(emotion,levels=names(sort(table(emotion),decreasing=TRUE))))

ggplot(sent_frame, aes(x=polarity)) + geom_bar(aes(y=..count.., fill=polarity))+scale_fill_brewer(palette="Dark2")+ggtitle('Sentiment Analysis of Tweets on Twitter about Vodafone')+
theme(legend.position="right")+ ylab('Number of Tweets')+xlab('Sentiment Categories')

# get the different sentiment groupings 
vodafone_sent = levels(factor(sent_frame$polarity))
#get number of groupings
num_vod_sent = length(vodafone_sent)

# create an empty array
vodafone.sent.docs = rep("", num_vod_sent)

for (i in 1:num_vod_sent)
 {
 tmp = v_corpus[polarity == vodafone_sent[i]]
 vodafone.sent.docs[i] = paste(tmp,collapse="")
 }
#vodafone.sent.docs = removeWords(vodafone.sent.docs, stopwords("english"))
v.corpus = Corpus(VectorSource(vodafone.sent.docs))
v.tdm = TermDocumentMatrix(v.corpus)
v.tdm = as.matrix(v.tdm)
colnames(v.tdm)= vodafone_sent

# creating, comparing and plotting the words on the cloud
comparison.cloud(v.tdm, colors = brewer.pal(num_vod_sent,"Dark2"),scale = c(3,.5), random.order = FALSE, title.size = 1.5)

