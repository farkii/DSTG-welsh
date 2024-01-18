library(bnlearn)

# Define the structure of the Bayesian network
network_structure <- model2network("[A][B|A][C|A][D|B:C]")

# Create an empty Bayesian network
bn <- empty.graph(names = c("A", "B", "C", "D"))

# Set the structure of the Bayesian network
bn <- bn + network_structure

# Set node probabilities (replace with your actual probabilities)
bn$A <- c(0.3, 0.7)
bn$B <- c(0.2, 0.8)
bn$C <- c(0.4, 0.6)
bn$D <- c(0.1, 0.9, 0.5, 0.5)

# Compile the Bayesian network
data <- data.frame(A = sample(0:1, 100, replace = TRUE), 
                   B = sample(0:1, 100, replace = TRUE),
                   C = sample(0:1, 100, replace = TRUE))
bn.fit <- bn.fit(bn, data = data)

# Set observed values for some variables in your input
input_values <- list(A = 1, B = 0, C = 1)

# Make predictions for the unobserved variables
predictions <- predict(bn.fit, node = "D", method = "bayes-lw", evidence = input_values)

# Print the predictions
print(predictions)