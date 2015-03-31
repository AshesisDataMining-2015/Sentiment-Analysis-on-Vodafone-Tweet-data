# Sentiment-Analysis-on-Vodafone-Tweet-data

Aim:
Analyzing the tweets on Vodafone to classify their tweets into positive, negative, and neutral, in order to help determine their performance in the global market 

Dataset:
The vodafone tweet dataset was obtained using R studio. Libraries like twitteR, sentiment, Rstem, plyr, among others were used to obtain this data. In the tweet data, there are 2000 unprocessed tweets that contain "Vodafone" in them. However to make it easy to evalutate these tweets semantically, the following  preprocessing steps would be taken :-

1. Transforming Text:
  As a first step to preprocessing, the tweets are converted to a data frame and then to corpus (the actual text in the tweet). 


2. Noise removal:
  The large text or corpus extracted are not neccessarily transformed or processed. In this step, nosiy components  like          punctuations, numbers, and stopwords are removed from the corpus. 


3. Stemming words:
  Some times people who tweet use shorthand writing when tweeting. For example, instead "coming", comin' is used in tweeting.     This makes the tweet it hard to analyze the tweet. In this step, stemming, a way of correcting these words to match them to     the "normal" state before analyzing the tweets.   
