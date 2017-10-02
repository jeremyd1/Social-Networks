library(dplyr)

### Analysis of Village 1 Networks
setwd("/Users/Jeremyd/Desktop/Social-Networks/Microfinance/Data")

# Grab Key File


# Village Characteristics
population <- find_population()
  
  
  
# Networks - 12 Total


# Borrow Money From 

data_file <- "network/AdjMatrix/adj_borrowmoney_vilno_1.csv"
key_file <- "network/AdjMatrixKeys/key_vilno_1.csv"
description <- "Village 1 - Degree Distribution for Borrowing Money (I)"
BMI<- explore_network(data_file, key_file, description)
BMI_











data_file <- "network/AdjMatrix/adj_templecompany_vilno_1.csv"
key_file <- "network/AdjMatrixKeys/key_vilno_1.csv"
description <- "Village 1 - Degree Distribution for Temple (I)"
TI <- explore_network(data_file, key_file, description)
