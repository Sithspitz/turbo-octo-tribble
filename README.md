# turbo-octo-tribble
RORC Correlation Analysis

The 'rorc_correlation_analysis_script.R' are for calculating the correlation between a single gene (e.g. RORC) and all other genes in the dataframe.

The 'restructuring_correlation_output' script is to restructure this output into an easy to manipulate format as below:
COL1      COL2
GeneID    pval
This above format allows for sorting by significance for e.g.

The 'correlation_plotting.R' is the method of plotting correlations from a dataframe.
