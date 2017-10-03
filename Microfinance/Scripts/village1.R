### Analysis of Village 1 Networks
setwd("/Users/Jeremyd/Desktop/Social-Networks/Microfinance/Data")

# Village Characteristics
key_file <- "network/AdjMatrixKeys/key_vilno_1.csv"
keys <- read.csv(key_file, header = FALSE)
population <- nrow(keys)


# Networks - 12 Total
elements <- c("Adjacency Matrix", "Data Frame of Degrees, Frequencies", 
              "Plot of Degree Distribution", "Average Degree", "Max Degree",
              "Min Degree", "Average Path Length", "Clustering Coefficient", 
              "Assortativity Coefficient")
adj_all = list()

# Borrow Money From 
data_file <- "network/AdjMatrix/adj_borrowmoney_vilno_1.csv"
description <- "Village 1 - Degree Distribution for Borrowing Money (I)"
BMF<- explore_network(data_file, key_file, description)
names(BMF) <- elements
adj_all[[length(adj_all) + 1]] = BMF[[1]]


# Give Advice To
data_file <- "network/AdjMatrix/adj_giveadvice_vilno_1.csv"
description <- "Village 1 - Degree Distribution for Giving Advice (I)"
GAT <- explore_network(data_file, key_file, description)
names(GAT) <- elements
adj_all[[length(adj_all) + 1]] = GAT[[1]]

# Help With a Decision
data_file <- "network/AdjMatrix/adj_helpdecision_vilno_1.csv"
description <- "Village 1 - Degree Distribution for Help With a Decision (I)"
HWD <- explore_network(data_file, key_file, description)
names(HWD) <- elements
adj_all[[length(adj_all) + 1]] = HWD[[1]]

# Borrow Rice or Kerosene 
data_file <- "network/AdjMatrix/adj_keroricecome_vilno_1.csv"
description <- "Village 1 - Degree Distribution for Borrow Rice Or Kerosene (I)"
BRK <- explore_network(data_file, key_file, description)
names(BRK) <- elements
adj_all[[length(adj_all) + 1]] = BRK[[1]]

# Lend Rice or Kerosene
data_file <- "network/AdjMatrix/adj_keroricego_vilno_1.csv"
description <- "Village 1 - Degree Distribution for Lend Rice Or Kerosene (I)"
LRK <- explore_network(data_file, key_file, description)
names(LRK) <- elements
adj_all[[length(adj_all) + 1]] = LRK[[1]]

# Lend Money to 
data_file <- "network/AdjMatrix/adj_lendmoney_vilno_1.csv"
description <- "Village 1 - Degree Distribution for Lending Money (I)"
LMT <- explore_network(data_file, key_file, description)
names(LMT) <- elements
adj_all[[length(adj_all) + 1]] = LMT[[1]]

# Obtain Medical Advice from
data_file <- "network/AdjMatrix/adj_medic_vilno_1.csv"
description <- "Village 1 - Degree Distribution for Obtaining Medical Advice (I)"
OMA <- explore_network(data_file, key_file, description)
names(OMA) <- elements
adj_all[[length(adj_all) + 1]] = OMA[[1]]

# Engage Socially With
data_file <- "network/AdjMatrix/adj_nonrel_vilno_1.csv"
description <- "Village 1 - Degree Distribution for Social Engagement (I)"
ESW <- explore_network(data_file, key_file, description)
names(ESW) <- elements
adj_all[[length(adj_all) + 1]] = ESW[[1]]

# Related To
data_file <- "network/AdjMatrix/adj_rel_vilno_1.csv"
description <- "Village 1 - Degree Distribution for Relations (I)"
RT <- explore_network(data_file, key_file, description)
names(RT) <- elements
adj_all[[length(adj_all) + 1]] = RT[[1]]

# Go to Temple with 
data_file <- "network/AdjMatrix/adj_templecompany_vilno_1.csv"
description <- "Village 1 - Degree Distribution for Temple (I)"
TE <- explore_network(data_file, key_file, description)
names(TE) <- elements
adj_all[[length(adj_all) + 1]] = TE[[1]]

# Invite To Home
data_file <- "network/AdjMatrix/adj_visitcome_vilno_1.csv"
description <- "Village 1 - Degree Distribution for Invited Home (I)"
ITH <- explore_network(data_file, key_file, description)
names(ITH) <- elements
adj_all[[length(adj_all) + 1]] = ITH[[1]]

# Visit in Another's Home
data_file <- "network/AdjMatrix/adj_visitgo_vilno_1.csv"
description <- "Village 1 - Degree Distribution for Visit Another's Home (I)"
VAH <- explore_network(data_file, key_file, description)
names(VAH) <- elements
adj_all[[length(adj_all) + 1]] = VAH[[1]]



### Analysis of the Specific People each Person interacts with 
base <- adj_all[[1]]
for (m in seq_along(adj_all)) {
  if (m != 1) {
    matrix <- adj_all[[m]]
    for (i in seq(population)) {
      for (j in seq(population)) {
        base[i,j] = base[i,j] + matrix[i,j]
      }
    }
  }
}

