library(outsider)
PartitionFinderProtein <- module_import('PartitionFinderProtein',
                                        repo = 'dombennett/om..partitionfinder')
example_fetch <- module_import('example_fetch',
                               repo = 'dombennett/om..partitionfinder')
# bring PartitionFinder examples to working directory
example_fetch(type = 'aminoacid')
# run on the "aminoacid" example folder
PartitionFinderProtein(arglist = 'aminoacid')
