library(igraph)

setwd("/Users/Jeremyd/Desktop/Social-Networks/Microfinance/Data")

# Individual Temple Data for Village 1 - who goes with whom to the temple? 
# Finds Keys for identifying individuals
templeIN_1.key <- read.csv("network/AdjMatrixKeys/key_vilno_1.csv", header = FALSE)
templeIN_1.key <- templeIN_1.key[,1] #[1] gives a df instead of a vector

# Read in Individual Temple Data 
templeIN_1.data <- read.csv("network/AdjMatrix/adj_templecompany_vilno_1.csv", header= FALSE) 

# Keys = rownames & colnames - for identification of individuals
row.names(templeIN_1.data) <- templeIN_1.key
names(templeIN_1.data) <- templeIN_1.key

# Convert data into an adjacency matrix
templeIN_1.matrix <- as.matrix(templeIN_1.data)

templeIN_1.graph <- graph_from_adjacency_matrix(templeIN_1.matrix)
# coords <- layout.fruchterman.reingold(templeIN_1.graph)*0.5
plot(templeIN_1.graph, verte.label = NA,
     vertex.size = degree(templeIN_1.matrix) * 0.25)


# For Each Type of RElationship
#   - Degree Distribution 
#     - plot for each relationships 
#   - Average Degree
#   - Clustering Coefficient
#     - measures the connectedness of a network
#   - Average Path Length
#     - picking any two nodes, what is the average distance?
# 
# For Each Type of Relationship + Trait
#   - Assortavivity coefficient
#   - distribution of traits

