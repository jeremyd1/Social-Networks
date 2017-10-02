library(igraph)
library(dplyr)
library(magrittr)
library(ggplot2)

setwd("/Users/Jeremyd/Desktop/Social-Networks/Microfinance/Data")

# Individual Temple Data for Village 1 - who goes with whom to the temple? 

# Finds Keys for identifying individuals
templeIN_1.key <- read.csv("network/AdjMatrixKeys/key_vilno_1.csv", header = FALSE)
templeIN_1.key <- templeIN_1.key[,1] # a vector

# Read in Individual Temple Data 
templeIN_1.data <- read.csv("network/AdjMatrix/adj_templecompany_vilno_1.csv", header= FALSE) 

# Keys = rownames & colnames - for identification of individuals
row.names(templeIN_1.data) <- templeIN_1.key
names(templeIN_1.data) <- templeIN_1.key

# Convert data into an adjacency matrix
templeIN_1.matrix <- as.matrix(templeIN_1.data)

# Convert adjacency matrix into an igraph object
templeIN_1.graph <- graph_from_adjacency_matrix(templeIN_1.matrix)

# Creates a numeric vector of Out Degrees
vector <- degree(templeIN_1.graph, v = V(templeIN_1.graph))
people <- names(vector)
names(vector) <- NULL

# Convert to a data frame
graph <- as.data.frame(vector) %>%
  mutate(id = people) %>%
  rename("frequency" = "vector")

graph_degrees <- graph %>%
  group_by(frequency) %>%
  summarize(n = n())

# Invidividual Temple Degree Distribution
ggplot(graph_degrees, aes(x = frequency, y = n)) + 
  geom_bar(aes(fill = frequency), stat = "identity") +
  scale_x_continuous(breaks = seq(1,24)) +
  labs(x = "degrees", y = "frequency") +
  ggtitle("Village 1 - Individual Temple Degree Distribution")


# Number of People in the Village 
num_people <- length(templeIN_1.key) # 843

# Degrees
avg_degree <- mean(graph$frequency) # 8.882
max_degree <- max(graph$frequency) # 24
min_degree <- min(graph$frequency) # 0

# Clustering Coefficient
transitivity(templeIN_1.graph) # 0.978213



