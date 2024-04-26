options(repos = c(CRAN = "https://cran.rstudio.com/"))

if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install(c("Biostrings", "GenomicRanges"))

library(GenoMagic)
library(Biostrings)  # Required for DNAStringSet
# Example DNA sequences
dna_examples = DNAStringSet(c("ATGCGTA", "TGCATGC", "CGTATCGTA", "ATATATC"))
# Analyzing the DNA sequences using your package's function
results = analyze_sequences(dna_examples)
print(results)

devtools::document()
devtools::install()
library(GenoMagic)

