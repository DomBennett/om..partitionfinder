library(outsider)
PartitionFinderMorphology <- module_import('PartitionFinderMorphology',
                                 repo = 'dombennett/om..partitionfinder')
# bring PartitionFinder examples to working directory
example_fetch(type = 'morphology')
# run on the "morphology" example folder
PartitionFinderMorphology('morphology')
