#Cluster the input documents and find the summary of each cluster

library(tm)
options(header=FALSE, stringsAsFactors=FALSE, fileEncoding="latin1")

inputData <- Corpus (DirSource("absolute input path"))
inputData <- tm_map(inputData, tolower)
inputData <- tm_map(inputData, removeNumbers)
inputData <- tm_map(inputData, removePunctuation)
inputData <- tm_map(inputData, removeWords, stopwords("english"))
inputData <- tm_map(inputData, stripWhitespace)
data_tm <- DocumentTermMatrix(inputData)
data_tfIdf <- weightTfIdf(data_tm, normalize=TRUE)
data_matrix <- as.matrix(data_tfIdf)
 

rownames(data_matrix) <- 1:nrow(data_matrix)
norm_eucl <- function(data_matrix) data_matrix/apply(data_matrix, MARGIN=1, FUN=function(x) sum(x^2)^0.5)
# 
# 
norm_data <- norm_eucl(data_matrix)
results <- kmeans(norm_data, 2)





