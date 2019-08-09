library(outsider)
PartitionFinder <- module_import('PartitionFinder',
                                 repo = 'dombennett/om..partitionfinder')
# bring PartitionFinder examples to working directory
example_fetch(type = 'dna')
# run on the "nucleotide" example folder
PartitionFinder('nucleotide')
