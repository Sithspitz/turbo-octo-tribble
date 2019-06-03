##########################################################
##--------------RORC Correlation Analysis---------------##
##########################################################

# Library
library(ggpubr)
library(dplyr)
setwd("C:/Users/Richard/DataShare/rorc_correlations/expression_data_by_mutation/training_data")

# Import
rorc_training_data <- read.csv("rorc_training.csv", row.names = 1, header = F)
training_data <- read.csv("training_data.csv", row.names = 1, header = F)

# Numerisise RORC data and training data
## Keep 'training_data' df for rownames
rorc_training_data2 <- as.numeric(rorc_training_data)
training_data2 <- as.matrix(training_data)
data_names <- training_data

# For loop testing...
my_list <- vector()
for (i in 1:nrow(training_data2)) {
  print(rownames(data_names[i, ]))
  row <- training_data2[i, ]
  corr_test <- cor.test(rorc_training_data2, row, method = "pearson")
  if(corr_test$p.value <=0.05) {
    my_list[length(my_list)+1] <- rownames(data_names[i, ])
    }
}

