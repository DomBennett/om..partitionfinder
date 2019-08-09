library(outsider)
PartitionFinderProtein <- module_import('PartitionFinderProtein',
                                 repo = 'dombennett/om..partitionfinder')
# bring PartitionFinder examples to working directory
example_fetch(type = 'aminoacid')
# run on the "aminoacid" example folder
PartitionFinderProtein('aminoacid')
