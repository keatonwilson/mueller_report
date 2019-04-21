#Mueller Report Wordcloud
#Keaton Wilson
#keatonwilson@me.com
#2019-04-19

#libraries
library(readtext)
library(tidyverse)
library(SnowballC)
library(wordcloud)
library(tm)

#Reading in the text file
raw = readLines("./mueller_text.txt", encoding = "UTF-8")

data = VCorpus(VectorSource(raw), readerControl=list(readPlain, language="en", load=TRUE))

corp = tm_map(data, removePunctuation)
corp = tm_map(corp, stripWhitespace)
corp = tm_map(corp, content_transformer(tolower))
corp = tm_map(corp, function(x)removeWords(x,stopwords()))
corp = tm_map(corp, function(x)removeNumbers(x))

wc = wordcloud(corp, scale = c(4.5, 1), min.freq = 15, colors = "black", max.words = 85)
