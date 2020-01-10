library(outsider)
PartitionFinderMorphology <- module_import('PartitionFinderMorphology',
                                 repo = 'dombennett/om..partitionfinder')
example_fetch <- module_import('example_fetch',
                               repo = 'dombennett/om..partitionfinder')
# bring PartitionFinder examples to working directory
example_fetch(type = 'morphology')
# run on the "morphology" example folder
PartitionFinderMorphology(arglist = c('--raxml', 'morphology'))
