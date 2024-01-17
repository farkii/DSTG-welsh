library(bnlearn)
library(Rgraphviz)
source("prepare_data.R")

data <- read_csv_file("korisnik2.csv")
str(data)

hc_model <- hc(data)


fitted_user_network <- bn.fit(hc_model, data = data)
fitted_user_network

graphviz.plot(fitted_user_network)