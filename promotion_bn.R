library(bnlearn)
library(Rgraphviz)
source("prepare_data.R")

create_global_bn_network <- function(){
    data <- read_csv_file("movies.csv")

    hc_model <- hc(data)
    fitted_network <- bn.fit(hc_model, data = data)
    
    return(fitted_network)
}

#ispisuje podatke o mrezi
#print(create_global_bn_network())

#kreira grafički prikaz grafa
#graphviz.plot(fitted_network)