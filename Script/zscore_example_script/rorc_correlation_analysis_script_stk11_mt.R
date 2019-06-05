##########################################################
##--------------RORC Correlation Analysis---------------##
##########################################################

# Library
library(ggpubr)
library(dplyr)


## Other Mutation group RORC correlations ##

# Import
setwd("H:/My Documents/BEAR Datashare/rorc_correlations/expression_data_by_mutation/stk11_mt_zscore/")
rorc_stk11_mt <- read.csv("rorc_stk11_mt.csv", row.names = 1, header = F)
stk11_mt <- read.csv("stk11_mt.csv", row.names = 1, header = F)

# Remove rows with only 0 in them
## Removes rows with std dev of 0
other_mt <- stk11_mt[apply(stk11_mt[,-1], 1, function(x) !all(x==0)),]
other_mt <- other_mt[!apply(other_mt[,-1], 1, function(x) sd(x)==0 ), ]
other_mt <- na.omit(other_mt)

# Numerisise RORC data and query data
## Keep 'data_names' df for rownames
rorc_other2 <- as.numeric(rorc_stk11_mt)
other_mt2 <- as.matrix(other_mt)
data_names <- other_mt

# For Loop Correlation Analysis Pearson
correlations <- vector()
for (i in 1:nrow(other_mt2)) {
  print(rownames(data_names[i, ]))
  row <- other_mt2[i, ]
  corr_test <- cor.test(rorc_other2, row, method = "pearson")
  if(corr_test$p.value <=0.05) {
    correlations[length(correlations)+1] <- rownames(data_names[i, ])
    correlations[length(correlations)+1] <- corr_test$p.value
    }
}

sig_corr <- as.data.frame(correlations)

setwd("H:/My Documents/BEAR Datashare/rorc_correlations/Output/stk11_mt_zscore/")
write.csv(sig_corr, "stk11_mt_sig_rorc_correlations_pearson.csv", row.names = F)

# For Loop Correlation Analysis Spearman
rm(correlations, sig_corr)

correlations <- vector()
for (i in 1:nrow(other_mt2)) {
  print(rownames(data_names[i, ]))
  row <- other_mt2[i, ]
  corr_test <- cor.test(rorc_other2, row, method = "spearman")
  if(corr_test$p.value <=0.05) {
    correlations[length(correlations)+1] <- rownames(data_names[i, ])
    correlations[length(correlations)+1] <- corr_test$p.value
  }
}

sig_corr <- as.data.frame(correlations)

write.csv(sig_corr, "stk11_mt_sig_rorc_correlations_spearman.csv", row.names = F)

