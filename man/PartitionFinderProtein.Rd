% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/functions.R
\name{PartitionFinderProtein}
\alias{PartitionFinderProtein}
\title{PartitionFinderProtein 2}
\usage{
PartitionFinderProtein(arglist = arglist_get(...), outdir = getwd())
}
\arguments{
\item{arglist}{Arguments for PartitionFinder}

\item{outdir}{Filepath to output files are placed}
}
\description{
Run PartitionFinderProtein 2
}
\examples{
library(outsider)
PartitionFinderProtein <- module_import('PartitionFinderProtein',
                                        repo = 'dombennett/om..partitionfinder')
example_fetch <- module_import('example_fetch',
                               repo = 'dombennett/om..partitionfinder')
# bring PartitionFinder examples to working directory
example_fetch(type = 'aminoacid')
# run on the "aminoacid" example folder
PartitionFinderProtein(arglist = 'aminoacid')
}
