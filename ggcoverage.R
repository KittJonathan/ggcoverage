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

# load track files
track.folder <- system.file("extdata", "RNA-seq", package = "ggcoverage")
track.df <- LoadTrackFile(track.folder = track.folder, format = "bw",
                          meta.info = sample.meta)
head(track.df)

# create mark region
mark.region <- data.frame(start = c(21678900,21732001,21737590),
                          end = c(21679900,21732400,21737650),
                          label = c("M1", "M2", "M3"))
mark.region

# load gtf file
gtf.file <- system.file("extdata", "used_hg19.gtf", package = "ggcoverage")
gtf.gr <- rtracklayer::import.gff(gtf.file, format = "gtf")

# Basic coverage
basic.coverage <- ggcoverage(data = track.df,
                             color = "auto",
                             mark.region = mark.region,
                             range.position = "out")
basic.coverage

basic.coverage <- ggcoverage(data = track.df,
                             color = "auto",
                             mark.region = mark.region,
                             range.position = "in")
basic.coverage

# Add gene annotation
basic.coverage +
  geom_gene(gtf.gr = gtf.gr)
