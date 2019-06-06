########### Restructing Correlation Data #############
library(dplyr)

# Import
setwd("./My Documents/BEAR Datashare/rorc_correlations/Output/")
data <- read.csv("total_mt_sig_rorc_correlations_pearson.csv", header = T)

# Script
one <- as.data.frame(as.character(data[seq(1, nrow(data), 2), ]))
two <- as.data.frame(data[seq(2, nrow(data),2), ])

restructured <- as.data.frame(cbind(one, two))

colnames(restructured) <- c("Hugo_Symbol", "pval")

# Export
write.csv(restructured, "total_mt_sig_rorc_correlations_pearson_easy_structure.csv", row.names = F)

