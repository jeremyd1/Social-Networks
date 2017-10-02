library(igraph)
library(dplyr)
library(magrittr)
library(ggplot2)

### find_population -> Finds the population of a village
# 
# ARGUMENTS
# key_file - String - name of key file
#
# RETURN
# int - number of people

find_population <- function(key_file) {
  keys <- read.csv(key_file, header = FALSE)
  return(nrows(keys))
}

### explore_network -> Finds characteristics of a Network
#
# ARGUMENTS
# data_file - String - name of file
# key_file - String - name of key file
# description - String - description of file
#
# RETURN 
# list
# [[1]] - vector of key,degree pairs
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
  igraph <- graph_from_adjacency_matrix(matrix)
  
  # Creates a numeric vector of each node's degree
  degrees <- degree(igraph, v = V(igraph))
  people <- names(degrees)
  names(degrees) <- NULL
  
  # Create a df of nodes, degrees
  results <- as.data.frame(degrees) %>%
    mutate(id = people)
  
  results_hist <- results %>%
    group_by(degrees) %>%
    summarize(n = n())
  
  # Plot of the Degree Distribution
  plot <- ggplot(results_hist, aes(x = degrees, y = n)) + 
    geom_bar(aes(fill = degrees), stat = "identity") +
    labs(x = "degrees", y = "frequency") +
    ggtitle(description)
  
  # Degree Characteristics
  avg_degree <- mean(graph$frequency) 
  max_degree <- max(graph$frequency) 
  min_degree <- min(graph$frequency) 
  
  # Average Path Length
  avg_path <- mean_distance(igraph) 
  
  # Clustering Coefficient
  clustering <- transitivity(igraph) 
  
  # Assortativity Coefficient based on Degrees
  assortativity <- assortativity_degree(igraph) 
  
  # Return Values
  values <- list(results, results_hist, plot, avg_degree, max_degree, 
                 min_degree, avg_path, clustering, assortativity)
  return(values)
}









