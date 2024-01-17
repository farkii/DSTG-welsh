library(bnlearn)
library(Rgraphviz)
source("prepare_data.R")
source("promotion_bn.R")

data <- read_csv_file("korisnik2.csv")
#ispisuje strukturu podataka
#str(data)

hc_model <- hc(data)


fitted_user_network <- bn.fit(hc_model, data = data)
fitted_user_network

#TODO dodati globalnu mrezu i spojiti ju sa korisnickom
fitted_global_network <- create_global_bn_network()
fitted_global_network

#kreira grafički prikaz grafa
#graphviz.plot(fitted_user_network)