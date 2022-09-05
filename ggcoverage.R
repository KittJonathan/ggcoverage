# ggcoverage
# last updated 2022-09-05
# https://showteeth.github.io/ggcoverage/articles/ggcoverage.html

# Install packages ----

remotes::install_github("showteeth/ggcoverage")
# BiocManager::install("rtracklayer")
# BiocManager::install("ggbio")
# BiocManager::install("rtracklayer")
# Load packages ----

library(rtracklayer)
library(ggcoverage)

# RNA-seq data ----

# load metadata
meta.file <- system.file("extdata", "RNA-seq", "meta_info.csv", package = "ggcoverage")
sample.meta <- read.csv(meta.file)
