% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BaalChIP-generics.R, R/BaalChIP-methods.R
\name{BaalChIP.run}
\alias{BaalChIP.run}
\alias{BaalChIP.run,BaalChIP-method}
\title{Method BaalChIP.run}
\usage{
BaalChIP.run(.Object, cores = 4, verbose = TRUE)

\S4method{BaalChIP.run}{BaalChIP}(.Object, cores = 4, verbose = TRUE)
}
\arguments{
\item{.Object}{An object of the \code{\link{BaalChIP}} class.}

\item{cores}{number of cores for parallel computing (default is 4).}

\item{verbose}{logical. If TRUE reports extra information on the process}
}
\value{
An object of the \code{\link{BaalChIP}} class.
}
\description{
BaalChIP.run is a wrapper convenience function, to compute allele counts and perform quality controls in one step. This function will use the package's defaults.
}
\details{
This function is a wrapper of the following functions: \code{\link{alleleCounts}}, \code{\link{QCfilter}}, \code{\link{mergePerGroup}}, \code{\link{filter1allele}}, \code{\link{getASB}}
}
\examples{
setwd(system.file("test", package = "BaalChIP"))
samplesheet <- "exampleChIP.tsv"
hets <- c("MCF7" = "MCF7_hetSNP.txt", "GM12891" = "GM12891_hetSNP.txt")
res <- BaalChIP(samplesheet = samplesheet, hets = hets)
res <- BaalChIP.run(res, cores = 2)

# summary of the QC step
summaryQC(res)
# summary of the ASB step
summaryASB(res)
}
\seealso{
\code{\link{summaryQC}}, \code{\link{plotQC}}
}
\author{
Ines de Santiago
}
