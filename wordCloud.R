#Script to generate word cloud 

inputData = Corpus (DirSource("absolute input path"))
inputData = tm_map(inputData, tolower)
inputData = tm_map(inputData, removeNumbers)
inputData = tm_map(inputData, removePunctuation)
inputData = tm_map(inputData, removeWords, stopwords("english"))
inputData = tm_map(inputData, stripWhitespace)
wordcloud(inputData, scale=c(5,0.5), max.words=100, random.order=FALSE, rot.per=0.35, use.r.layout=FALSE, colors=brewer.pal(8, "Dark2"))



