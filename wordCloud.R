#Script to generate word cloud 

library(tm)
inputData = Corpus(DirSource("C:\\Users\\kachandrasekar\\Desktop\\R-Play\\WordCloudSubjectInput"))
inputData = tm_map(inputData, tolower)
inputData = tm_map(inputData, removeNumbers)
inputData = tm_map(inputData, removePunctuation)
inputData = tm_map(inputData, removeWords, stopwords("english"))

#Remove black listed words - load black listed words from file

blackListedWords = read.csv("C:\\Users\\kachandrasekar\\Desktop\\R-Play\\WordCloudBlackList\\BlackList.txt", header=FALSE)

inputData = tm_map(inputData, removeWords, blackListedWords)

inputData = tm_map(inputData, stripWhitespace)
wordcloud(inputData,
          scale=c(5,0.5), max.words=100, random.order=FALSE, rot.per=0.35, use.r.layout=FALSE, colors=brewer.pal(8, "Dark2"))
