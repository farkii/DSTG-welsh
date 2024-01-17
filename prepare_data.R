read_csv_file <- function(file_path) {
    if (missing(file_path)) {
        stop("Please provide the file path.")
    }
    dataframe <- read.csv(file_path)

    movie_data <- dataframe[dataframe$country %in% c("United States", "United Kingdom", "Australia"), 
                            c("rating", "genre", "score", "country")]
    missing_scores <- is.na(movie_data$score)
    movie_data$score_category <- as.character(cut(movie_data$score, 
                                            breaks = c(-Inf, 5, 7, Inf),
                                            labels = c("low", "medium", "high"),
                                            include.lowest = TRUE))

    movie_data <- movie_data[, -which(names(movie_data) == "score")]
    
    movie_data$score_category[missing_scores] <- "missing"

    movie_data$rating <- as.factor(movie_data$rating)
    movie_data$genre <- as.factor(movie_data$genre)
    #movie_data$star <- as.factor(movie_data$star)
    movie_data$country <- as.factor(movie_data$country)
    #movie_data$company <- as.factor(movie_data$company)
    movie_data$score_category <- as.factor(movie_data$score_category)

    return(movie_data)
}