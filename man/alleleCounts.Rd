% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BaalChIP-generics.R, R/BaalChIP-methods.R
\name{alleleCounts}
\alias{alleleCounts}
\alias{alleleCounts,BaalChIP-method}
\title{Method alleleCounts}
\usage{
alleleCounts(
  .Object,
  min_base_quality = 10,
  min_mapq = 15,
  verbose = TRUE,
  all_hets = FALSE
)

\S4method{alleleCounts}{BaalChIP}(
  .Object,
  min_base_quality = 10,
  min_mapq = 15,
  verbose = TRUE,
  all_hets = FALSE
)
}
\arguments{
\item{.Object}{An object of the \code{\link{BaalChIP}} class.}

\item{min_base_quality}{A numeric value indicating the minimum read base quality below which the base is ignored when summarizing pileup information (default 10).}

\item{min_mapq}{A numeric value indicating the minimum mapping quality (MAPQ) below which the entire read is ignored (default 15).}

\item{verbose}{logical. If TRUE reports extra information on the process}

\item{all_hets}{logical. If TRUE don't filter for only peak regions}
}
\value{
An updated \code{\link{BaalChIP}} object with the slot \code{alleleCounts} containing a list of GRanges objects.
}
\description{
Generates allele-specific read count data from each BAM ChIP-seq dataset for each variant.
}
\details{
Utilizes the information within the \code{samples} slot of a BaalChIP object. Will primarily find all variants overlapping peaks. Then, for each variant, computes the number of reads carrying the reference (REF) and alternative (ALT) alleles.
}
\note{
BaalChIP computes allelic counts at each variant position with Rsamtools pileup function. The algorithm follows pileup::Rsamtools by automatically excluding reads flagged as unmapped, secondary, duplicate, or not passing quality controls.
}
\examples{
setwd(system.file("test", package = "BaalChIP"))
samplesheet <- "exampleChIP.tsv"
hets <- c("MCF7" = "MCF7_hetSNP.txt", "GM12891" = "GM12891_hetSNP.txt")
res <- BaalChIP(samplesheet = samplesheet, hets = hets)
res <- alleleCounts(res, min_base_quality = 10, min_mapq = 15)

# retrieve alleleCounts:
counts <- BaalChIP.get(res, "alleleCountsPerBam")

# alleleCounts are grouped by bam_name and group_name:
names(counts)
names(counts[["MCF7"]])

# check out the result for one of the bam files:
counts[["MCF7"]][[1]]
}
\seealso{
\code{\link{BaalChIP.get}}
}
\author{
Ines de Santiago
}
