library(bnlearn)
library(Rgraphviz)
source("prepare_data.R")

data <- read_csv_file("movies.csv")
str(data)

hc_model <- hc(data)
fitted_network <- bn.fit(hc_model, data = data)
fitted_network

graphviz.plot(fitted_network)