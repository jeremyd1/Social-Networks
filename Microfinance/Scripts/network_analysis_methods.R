library(igraph)
library(dplyr)
library(magrittr)
library(ggplot2)

### explore_network -> Finds characteristics of a Network
#
# ARGUMENTS
# data_file - String - name of file
# key_file - String - name of key file
# description - String - description of file
#
# RETURN 
# list
# [[1]] - adj matrix
# [[2]] - data frame of degrees and their frequency
# [[3]] - plot of degree distribution
# [[4]] - average degree
# [[5]] - max degree
# [[6]] - min degree
# [[7]] - average path length
# [[8]] - clustering coefficient
# [[9]] - assortativity coefficient 

explore_network <- function(data_file, key_file, description) {
  keys <- read.csv(key_file, header = FALSE)
  keys <- keys[,1] # a vector
  
  # Read in Individual Temple Data 
  data <- read.csv(data_file, header= FALSE) 
  
  # Keys = rownames & colnames - for identification of individuals
  row.names(data) <- keys
  names(data) <- keys
  
  # Convert data into an adjacency matrix
  matrix <- as.matrix(data)
  
  # Convert adjacency matrix into an igraph object
  g <- graph_from_adjacency_matrix(matrix)
  
  # Creates a numeric vector of each node's degree
  degrees <- (degree(g, v = V(g)))/2 # IN/OUT count as 1
  id <- names(degrees)
  names(degrees) <- NULL
  
  # Create a df of nodes, degrees
  results <- as.data.frame(degrees)
  
  results_hist <- results %>%
    group_by(degrees) %>%
    summarize(n = n())
  
  # Plot of the Degree Distribution
  plot <- ggplot(results_hist, aes(x = degrees, y = n)) + 
    geom_bar(aes(fill = degrees), stat = "identity") +
    labs(x = "degrees", y = "frequency") +
    ggtitle(description)
  
  # Degree Characteristics
  avg_degree <- mean(results$degrees) 
  max_degree <- max(results$degrees) 
  min_degree <- min(results$degrees) 
  
  # Average Path Length
  avg_path <- mean_distance(g) 
  
  # Clustering Coefficient
  clustering <- transitivity(g) 
  
  # Assortativity Coefficient based on Degrees
  assortativity <- assortativity_degree(g) 
  
  # Return Values
  values <- list(matrix, results_hist, plot, avg_degree, max_degree, 
                 min_degree, avg_path, clustering, assortativity)
  return(values)
}









