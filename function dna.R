#' Analyze DNA Sequences
#'
#' This function performs a basic analysis of DNA sequences.
#' @param dna A DNAStringSet object containing DNA sequences.
#' @return A data frame with DNA sequence statistics.
#' @export
#' @examples
#' dna <- DNAStringSet(c("ACTG", "CAGT"))
#' analyze_sequences(dna)
analyze_sequences <- function(dna) {
  require(Biostrings)
  result <- data.frame(
    length = width(dna),
    gc_content = letterFrequency(dna, "GC", as.prob = TRUE)
  )
  return(result)
}
