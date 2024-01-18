library(bnlearn)
library(Rgraphviz)
source("prepare_data.R")


get_user_bn_network <- function(filepath){
    data <- read_csv_file(filepath)
    data$rating <- factor(data$rating, levels = c("","Approved","G","NC-17","Not Rated","PG","PG-13","R","TV-MA","Unrated","X"))
    data$genre <- factor(data$genre, levels = c("Action","Adventure","Animation","Biography","Comedy","Crime","Drama","Family","Fantasy","Horror","Mystery","Romance","Sci-Fi","Thriller","Western"))
    data$country <- factor(data$country, levels = c("Australia","United Kingdom","United States"))
    data$score_category <- factor(data$score_category, levels = c("high","low","medium"))
    hc_model <- hc(data)
    fitted_user_network <- bn.fit(hc_model, data = data)

    return (fitted_user_network)
}