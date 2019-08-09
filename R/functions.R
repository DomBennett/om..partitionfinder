
base_function <- function(cmd, ...) {
  arglist <- arglist_get(...)
  # if input file determines wd, convert the filepath to its directory
  files_to_send <- filestosend_get(arglist = arglist)
  arglist <- c(paste0('/partitionfinder/', cmd), arglist)
  arglist <- arglist_parse(arglist = arglist)
  otsdr <- outsider_init(pkgnm = 'om..partitionfinder', cmd = 'python',
                         wd = getwd(), files_to_send = files_to_send,
                         arglist = arglist)
  run(otsdr)
}

#' @name example_fetch
#' @title Retrieve PartitionFinder example files
#' @description Bring PartitionFinder example files for demonstrations of either
#' nucleotide, morphology or amino acid runs into a directory, default working
#' directory.
#' @param type Either nucleotide, morphology or aminoacid
#' @param dr Directory to bring the files
#' @example examples/PartitionFinder.R
#' @export
example_fetch <- function(type = c('nucleotide', 'morphology', 'aminoacid'),
                          dr = getwd()) {
  type <- match.arg(type)
  flpth <- system.file(file.path('examples', type),
                       package = 'om..partitionfinder')
  outdir <- file.path(dr, type)
  if (!dir.exists(outdir)) {
    dir.create(outdir)
  }
  fls <- list.files(path = flpth)
  for (fl in fls) {
    file.copy(from = file.path(flpth, fl), to = file.path(outdir, fl),
              overwrite = TRUE)
  }
  invisible(TRUE)
}

#' @name PartitionFinder
#' @title PartitionFinder 2
#' @description Run PartitionFinder 2
#' @param ... Arguments
#' @example examples/PartitionFinder.R
#' @export
PartitionFinder <- function(...) {
  base_function(cmd = 'PartitionFinder.py', ...)
}

#' @name PartitionFinderProtein
#' @title PartitionFinderProtein 2
#' @description Run PartitionFinderProtein 2
#' @param ... Arguments
#' @example examples/PartitionFinderProtein.R
#' @export
PartitionFinderProtein <- function(...) {
  base_function(cmd = 'PartitionFinderProtein.py', ...)
}

#' @name PartitionFinderMorphology
#' @title PartitionFinderMorphology 2
#' @description Run PartitionFinderMorphology 2
#' @param ... Arguments
#' @example examples/PartitionFinderMorphology.R
#' @export
PartitionFinderMorphology <- function(...) {
  base_function(cmd = 'PartitionFinderMorphology.py', ...)
}
