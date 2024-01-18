source("promotion_bn.R")
source("user_promotion_bn.R")
filepath <- "input_data.csv"

bn_network <- create_global_bn_network()
user_bn_network <- get_user_bn_network("korisnik2.csv")
 
movie_data <- read.csv(filepath)
movie_data <- na.omit(movie_data)
movie_data <- movie_data[movie_data$country %in% c("United States", "United Kingdom", "Australia"),c("name","rating","genre","released","score","director","writer","star","country","company","runtime")]

data <- read_csv_file(filepath)
data$rating <- factor(data$rating, levels = c("","Approved","G","NC-17","Not Rated","PG","PG-13","R","TV-MA","Unrated","X"))
data$genre <- factor(data$genre, levels = c("Action","Adventure","Animation","Biography","Comedy","Crime","Drama","Family","Fantasy","Horror","Mystery","Romance","Sci-Fi","Thriller","Western"))
data$country <- factor(data$country, levels = c("Australia","United Kingdom","United States"))
data$score_category <- factor(data$score_category, levels = c("high","low","medium"))

new_data <- subset(data, select = -score_category)

predictions_user <- predict(user_bn_network, node = "score_category", data = new_data)
predictions_user <- as.character(predictions_user)
high_indices_user <- which(predictions_user == "high")
medium_indices_user <- which(predictions_user == "medium")
low_indices_user <- which(predictions_user == "low")


predictions_global <- predict(bn_network, node = "score_category", data = new_data)
predictions_global <- as.character(predictions_global)
high_indices_global <- which(predictions_global == "high")
medium_indices_global <- which(predictions_global == "medium")
low_indices_global <- which(predictions_global == "low")

highest_indices <- intersect(which(predictions_global == "high"), which(predictions_user == "high"))

if(length(highest_indices) != 0){
    for (i in highest_indices){
        print(movie_data[i, ])
    }
}
if(length(high_indices_user) != 0){
    for (i in high_indices_user){
        print(movie_data[i, ])
    }
}
if(length(high_indices_global) != 0){
    for (i in high_indices_global){
        print(movie_data[i, ])
    }
} 