library(outsider)
PartitionFinder <- module_import('PartitionFinder',
                                 repo = 'dombennett/om..partitionfinder')
example_fetch <- module_import('example_fetch',
                               repo = 'dombennett/om..partitionfinder')
# bring PartitionFinder examples to working directory
example_fetch(type = 'nucleotide')
# run on the "nucleotide" example folder
PartitionFinder('nucleotide')
