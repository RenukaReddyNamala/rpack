#' Find Overlaps in Genomic Ranges
#'
#' This function identifies overlaps between two sets of genomic intervals.
#' @param gr1 GenomicRanges object representing the first set of intervals.
#' @param gr2 GenomicRanges object representing the second set of intervals.
#' @return A GenomicRanges object with the overlaps.
#' @export
#' @examples
#' gr1 <- GRanges(seqnames = c("chr1", "chr1"), ranges = IRanges(start = c(100, 200), end = c(150, 250)))
#' gr2 <- GRanges(seqnames = c("chr1"), ranges = IRanges(start = 130, end = 300))
#' find_overlaps(gr1, gr2)
find_overlaps <- function(gr1, gr2) {
  require(GenomicRanges)
  overlaps <- findOverlaps(gr1, gr2)
  return(intersect(gr1[queryHits(overlaps)], gr2[subjectHits(overlaps)]))
}
#' Plot Genome Coverage
#'
#' This function visualizes the coverage across a genomic region.
#' @param coverage A numeric vector or Rle (Run-length encoding) representing coverage data.
#' @param region A character string specifying the genomic region to be plotted.
#' @return A plot showing genomic coverage.
#' @export
#' @examples
#' coverage <- Rle(c(rep(20, 100), rep(10, 100), rep(5, 100)))
#' plot_genome_coverage(coverage, "chr1:1-300")
plot_genome_coverage <- function(coverage, region) {
  require(ggplot2)
  df <- data.frame(position = seq_along(coverage), coverage = as.integer(coverage))
  ggplot(df, aes(x = position, y = coverage)) +
    geom_line() +
    ggtitle(paste("Coverage Plot for", region)) +
    xlab("Position") +
    ylab("Coverage")
}
