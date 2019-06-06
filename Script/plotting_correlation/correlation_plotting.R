########### Correlation Plotting ################
## This example uses the total_mt_rsem interesting_genes_to_plot ##

library(ggpubr)
setwd("H:/My Documents/BEAR Datashare/rorc_correlations/correlation_plots/total_mt_zscore/")

# Import
my_data <- read.csv("total_mt_zscore.csv", header = F, row.names = 1)

# Transpose
transposed <- as.data.frame(t(my_data))

# Make a analysis df
## With the comparison genes of interest
analysis_df <- select(transposed, RORC, ARNT, HIF1A, SIRT1, BCOR, IL17B, IL17D)

# Export location set up
dir.create("correlation_plots")
setwd("./correlation_plots/")

### Correlation Plots all vs RORC ###
cairo_pdf("./ARNT.pdf")
ggscatter(analysis_df, x = "RORC", y = "ARNT",
          add = "reg.line", conf.int = T, cor.coef = T,
          cor.method = "pearson")
dev.off()

cairo_pdf("./HIF1A.pdf")
ggscatter(analysis_df, x = "RORC", y = "HIF1A",
          add = "reg.line", conf.int = T, cor.coef = T,
          cor.method = "pearson")
dev.off()

cairo_pdf("./SIRT1.pdf")
ggscatter(analysis_df, x = "RORC", y = "SIRT1",
          add = "reg.line", conf.int = T, cor.coef = T,
          cor.method = "pearson")
dev.off()

cairo_pdf("./BCOR.pdf")
ggscatter(analysis_df, x = "RORC", y = "BCOR",
          add = "reg.line", conf.int = T, cor.coef = T,
          cor.method = "pearson")
dev.off()

cairo_pdf("./IL17B.pdf")
ggscatter(analysis_df, x = "RORC", y = "IL17B",
          add = "reg.line", conf.int = T, cor.coef = T,
          cor.method = "pearson")
dev.off()

cairo_pdf("./IL17D.pdf")
ggscatter(analysis_df, x = "RORC", y = "IL17D",
          add = "reg.line", conf.int = T, cor.coef = T,
          cor.method = "pearson")
dev.off()

