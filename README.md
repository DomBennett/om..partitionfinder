
<!--
The README should be used to describe the program. It acts like the homepage of
your module.

Edit README.Rmd not README.md. The .Rmd file can be knitted to parse real-code
examples and show their output in the .md file.

To knit, use devtools::build_readme() or outsider.devtools::build()

Edit the template to describe your program: how to install, import and run;
run exemplary, small demonstrations; present key arguments; provide links and
references to the program that the module wraps.

Learn more about markdown and Rmarkdown:
https://daringfireball.net/projects/markdown/syntax
https://rmarkdown.rstudio.com/
-->

# Run [`partitionfinder`](http://www.robertlanfear.com/partitionfinder/) with `outsider` in R

[![Build
Status](https://travis-ci.org/dombennett/om..partitionfinder.svg?branch=master)](https://travis-ci.org/dombennett/om..partitionfinder)

> Select best-fit partitioning schemes and models of molecular evolution
> for phylogenetic analyses.

<!-- Install information -->

## Install and look up help

``` r
library(outsider)
#> ----------------
#> outsider v 0.1.0
#> ----------------
#> - Security notice: be sure of which modules you install
module_install(repo = "dombennett/om..partitionfinder")
#> -----------------------------------------------------
#> Warning: You are about to install an outsider module!
#> -----------------------------------------------------
#> Outsider modules install and run external programs
#> via Docker <https://www.docker.com>. These external
#> programs may communicate with the internet and could
#> potentially be malicious.
#> 
#> Be sure to know the module you are about to install:
#> Is it from a trusted developer? Are colleagues using
#> it? Is it supposed to download lots of data? Is it
#> well used (e.g. check number of stars on GitHub)?
#> -----------------------------------------------------
#>  Module information
#> -----------------------------------------------------
#> program: PartitionFinder2
#> details: PartitionFinder 2 is free open source software to select best-fit partitioning schemes and models of molecular evolution for phylogenetic analyses.
#> docker: dombennett
#> github: dombennett
#> url: https://github.com/DomBennett/om..partitionfinder
#> image: dombennett/om_partitionfinder
#> container: om_partitionfinder
#> package: om..partitionfinder
#> Travis CI: Passing
#> -----------------------------------------------------
#> Enter any key to continue or press Esc to quit
# module_help(repo = "dombennett/om..partitionfinder")
```

<!-- Detailed examples -->

## Examples

The module comes with three functions for each program comprising the
“PartitionFinder2” software.

  - `PartitionFinder` - For nucleotide data
  - `PartitionFinderMorphology` - For morphological data
  - `PartitionFinderProtein` - For protein data

The module ships with example datasets. These data can be accessed by
using the `example_fetch` function.

At a minimum all that is required is to provide a input folder
containing the configuration file and the data. In the arguments, there
is no need to call python, this is done by the module. For example, on
the command-line if you wrote `python PartitionFinder.py example` where
“example” is the name of the input folder, in R this would be
`partitionfinder("example")`.

If required, additional arguments can be provided as a character vector.
E.g.

    python PartitionFinder.py --raxml example/

In R becomes …

``` r
partitionfinder(c('--raxml', 'example/'))
```

Each argument must be a separate charcter in the argument list vector.

### DNA

``` r
library(outsider)
PartitionFinder <- module_import('PartitionFinder',
                                 repo = 'dombennett/om..partitionfinder')
# show help
PartitionFinder('-h')
#> Usage: python PartitionFinder.py [options] <foldername>
#> 
#>     PartitionFinder and PartitionFinderProtein are designed to discover optimal
#>     partitioning schemes for nucleotide and amino acid sequence alignments.
#>     They are also useful for finding the best model of sequence evolution for datasets.
#> 
#>     The Input: <foldername>: the full path to a folder containing:
#>         - A configuration file (partition_finder.cfg)
#>         - A nucleotide/aa alignment in Phylip format
#>     Take a look at the included 'example' folder for more details.
#> 
#>     The Output: A file in the same directory as the .cfg file, named
#>     'analysis' This file contains information on the best
#>     partitioning scheme, and the best model for each partiiton
#> 
#>     Usage Examples:
#>         >python PartitionFinder.py example
#>         Analyse what is in the 'example' sub-folder in the current folder.
#> 
#>         >python PartitionFinder.py -v example
#>         Analyse what is in the 'example' sub-folder in the current folder, but
#>         show all the debug output
#> 
#>         >python PartitionFinder.py -c ~/data/frogs
#>         Check the configuration files in the folder data/frogs in the current
#>         user's home folder.
#> 
#>         >python PartitionFinder.py --force-restart ~/data/frogs
#>         Deletes any data produced by the previous runs (which is in
#>         ~/data/frogs/output) and starts afresh
#>     
#> 
#> Options:
#>   -h, --help            show this help message and exit
#>   -v, --verbose         show debug logging information (equivalent to --debug-
#>                         out=all)
#>   -c, --check-only      just check the configuration files, don't do any
#>                         processing
#>   -f, --force-restart   delete all previous output and start afresh (!)
#>   -p N, --processes=N   Number of concurrent processes to use. Use -1 to match
#>                         the number of cpus on the machine. The default is to
#>                         use -1.
#>   --show-python-exceptions
#>                         If errors occur, print the python exceptions
#>   --save-phylofiles     save all of the phyml or raxml output. This can take a
#>                         lot of space(!)
#>   --dump-results        Dump all results to a binary file. This is only of use
#>                         for testing purposes.
#>   --compare-results     Compare the results to previously dumped binary
#>                         results. This is only of use for testing purposes.
#>   -q, --quick           Avoid anything slow (like writing schemes at each
#>                         step),useful for very large datasets.
#>   -r, --raxml           Use RAxML (rather than PhyML) to do the analysis. See
#>                         the manual
#>   -n, --no-ml-tree      Estimate a starting tree with NJ (PhyML) or MP (RaxML)
#>                         instead of the default which is to estimate a starting
#>                         tree with ML  using in RAxML. Not recommended.
#>   --cmdline-extras=N    Add additional commands to the phyml or raxml
#>                         commandlines that PF uses.This can be useful e.g. if
#>                         you want to change the accuracy of lnL calculations
#>                         ('-e' option in raxml), or use multi-threaded versions
#>                         of raxml that require you to specify the number of
#>                         threads you will let raxml use ('-T' option in raxml.
#>                         E.g. you might specify this: --cmndline_extras ' -e
#>                         2.0 -T 10 ' N.B. MAKE SURE YOU PUT YOUR EXTRAS IN
#>                         QUOTES, and only use this command if you really know
#>                         what you're doing and are very familiar with raxml and
#>                         PartitionFinder
#>   --weights=N           Mainly for algorithm development. Only use it if you
#>                         know what you're doing.A list of weights to use in the
#>                         clustering algorithms. This list allows you to assign
#>                         different weights to: the overall rate for a subset,
#>                         the base/amino acid frequencies, model parameters, and
#>                         alpha value. This will affect how subsets are
#>                         clustered together. For instance: --cluster_weights
#>                         '1, 2, 5, 1', would weight the base freqeuncies 2x
#>                         more than the overall rate, the model parameters 5x
#>                         more, and the alpha parameter the same as the model
#>                         rate
#>   --kmeans=type         This defines which sitewise values to use: entropy or
#>                         tiger  --kmeans entropy: use entropies for sitewise
#>                         values --kmeans tiger: use TIGER rates for sitewise
#>                         values (only valid for Morphology)
#>   --rcluster-percent=N  This defines the proportion of possible schemes that
#>                         the relaxed clustering algorithm will consider before
#>                         it stops looking. The default is 10%. e.g. --rcluster-
#>                         percent 10.0
#>   --rcluster-max=N      This defines the number of possible schemes that the
#>                         relaxed clustering algorithm will consider before it
#>                         stops looking. The default is to look at the larger
#>                         value out of 1000, and 10 times the number of data
#>                         blocks you have. e.g. --rcluster-max 1000
#>   --min-subset-size=N   This defines the minimum subset size that the kmeans
#>                         and rcluster algorithm will accept. Subsets smaller
#>                         than this  will be merged at with other subsets at the
#>                         end of the algorithm (for kmeans) or at the start of
#>                         the algorithm (for rcluster). See manual for details.
#>                         The default value for kmeans is 100. The default value
#>                         for rcluster is to ignore this option. e.g. --min-
#>                         subset-size 100
#>   --debug-output=REGION,REGION,...
#>                         (advanced option) Provide a list of debug regions to
#>                         output extra information about what the program is
#>                         doing. Possible regions are 'all' or any of {subset,su
#>                         bset_ops,raxml,parser,model_util,results,entropy,align
#>                         ment,concurrent.futures,PIL,threadpool,progress,main,c
#>                         onfig,reporter,PIL.Image,kmeans,util,concurrent,morph_
#>                         tige,analysis_m,neighbour,scheme,submodels,database,an
#>                         alysis,phyml,raxml_mode,model_load,phyml_mode,sklearn}
#>                         .
#>   --all-states          In the kmeans and rcluster algorithms, this stipulates
#>                         that PartitionFinder should not produce subsets that
#>                         do not have all possible states present. E.g. for DNA
#>                         sequence data, all subsets in the final scheme must
#>                         have A, C, T,  and G nucleotides present. This can
#>                         occasionally be useful for downstream  analyses,
#>                         particularly concerning amino acid datasets.
#>   --profile             Output profiling information after running (this will
#>                         slow everything down!)

# data
example_fetch <- module_import('example_fetch',
                               repo = 'dombennett/om..partitionfinder')
example_fetch(type = 'nucleotide')

# run on the "nucleotide" example folder
PartitionFinder(arglist = 'nucleotide')
#> INFO     | 2020-01-10 15:52:51,838 | ------------- PartitionFinder 2.1.1 -----------------
#> INFO     | 2020-01-10 15:52:51,839 | You have Python version 2.7
#> INFO     | 2020-01-10 15:52:51,839 | Command-line arguments used: /partitionfinder/PartitionFinder.py nucleotide
#> INFO     | 2020-01-10 15:52:51,839 | ------------- Configuring Parameters -------------
#> INFO     | 2020-01-10 15:52:51,839 | Setting datatype to 'DNA'
#> INFO     | 2020-01-10 15:52:51,839 | Setting phylogeny program to 'phyml'
#> INFO     | 2020-01-10 15:52:51,840 | Program path is here /partitionfinder/programs
#> INFO     | 2020-01-10 15:52:51,840 | Setting working folder to: '/working_dir/nucleotide'
#> INFO     | 2020-01-10 15:52:51,841 | Loading configuration at './partition_finder.cfg'
#> INFO     | 2020-01-10 15:52:51,845 | Setting 'alignment' to 'test.phy'
#> INFO     | 2020-01-10 15:52:51,845 | Setting 'branchlengths' to 'linked'
#> INFO     | 2020-01-10 15:52:51,846 | You set 'models' to: GTR, GTR+G, GTR+I+G
#> INFO     | 2020-01-10 15:52:51,854 | This analysis will use the following 3 models of molecular evolution
#> INFO     | 2020-01-10 15:52:51,854 | GTR, GTR+G, GTR+I+G
#> INFO     | 2020-01-10 15:52:51,855 | Setting 'model_selection' to 'aicc'
#> INFO     | 2020-01-10 15:52:51,859 | Setting 'search' to 'greedy'
#> INFO     | 2020-01-10 15:52:51,860 | ------------------------ BEGINNING NEW RUN -------------------------------
#> INFO     | 2020-01-10 15:52:51,860 | Looking for alignment file './test.phy'...
#> INFO     | 2020-01-10 15:52:51,860 | Using 2 cpus
#> INFO     | 2020-01-10 15:52:51,861 | Beginning Analysis
#> INFO     | 2020-01-10 15:52:51,873 | Checking previously run configuration data...
#> INFO     | 2020-01-10 15:52:51,874 | Reading alignment file './test.phy'
#> INFO     | 2020-01-10 15:52:51,875 | Reading alignment file './analysis/start_tree/source.phy'
#> INFO     | 2020-01-10 15:52:51,877 | Starting tree file found.
#> INFO     | 2020-01-10 15:52:51,878 | Performing Greedy Analysis
#> INFO     | 2020-01-10 15:52:51,878 |    *** Analysing starting scheme ***
#> INFO     | 2020-01-10 15:52:51,882 |       Finished subset 1/9, 11.11 percent done
#> INFO     | 2020-01-10 15:52:51,883 |       Finished subset 2/9, 22.22 percent done
#> INFO     | 2020-01-10 15:52:51,884 |       Finished subset 3/9, 33.33 percent done
#> INFO     | 2020-01-10 15:52:51,886 |       Finished subset 4/9, 44.44 percent done
#> INFO     | 2020-01-10 15:52:51,887 |       Finished subset 5/9, 55.56 percent done
#> INFO     | 2020-01-10 15:52:51,889 |       Finished subset 6/9, 66.67 percent done
#> INFO     | 2020-01-10 15:52:51,890 |       Finished subset 7/9, 77.78 percent done
#> INFO     | 2020-01-10 15:52:51,891 |       Finished subset 8/9, 88.89 percent done
#> INFO     | 2020-01-10 15:52:51,892 |       Finished subset 9/9, 100.00 percent done
#> INFO     | 2020-01-10 15:52:51,894 |    ***Greedy algorithm step 1***
#> INFO     | 2020-01-10 15:52:51,895 |       Analysing 36 new subset pairs
#> INFO     | 2020-01-10 15:52:51,899 |       Finished subset 1/36, 2.78 percent done
#> INFO     | 2020-01-10 15:52:51,900 |       Finished subset 2/36, 5.56 percent done
#> INFO     | 2020-01-10 15:52:51,901 |       Finished subset 3/36, 8.33 percent done
#> INFO     | 2020-01-10 15:52:51,902 |       Finished subset 4/36, 11.11 percent done
#> INFO     | 2020-01-10 15:52:51,903 |       Finished subset 5/36, 13.89 percent done
#> INFO     | 2020-01-10 15:52:51,905 |       Finished subset 6/36, 16.67 percent done
#> INFO     | 2020-01-10 15:52:51,906 |       Finished subset 7/36, 19.44 percent done
#> INFO     | 2020-01-10 15:52:51,907 |       Finished subset 8/36, 22.22 percent done
#> INFO     | 2020-01-10 15:52:51,908 |       Finished subset 9/36, 25.00 percent done
#> INFO     | 2020-01-10 15:52:51,909 |       Finished subset 10/36, 27.78 percent done
#> INFO     | 2020-01-10 15:52:51,911 |       Finished subset 11/36, 30.56 percent done
#> INFO     | 2020-01-10 15:52:51,912 |       Finished subset 12/36, 33.33 percent done
#> INFO     | 2020-01-10 15:52:51,913 |       Finished subset 13/36, 36.11 percent done
#> INFO     | 2020-01-10 15:52:51,914 |       Finished subset 14/36, 38.89 percent done
#> INFO     | 2020-01-10 15:52:51,916 |       Finished subset 15/36, 41.67 percent done
#> INFO     | 2020-01-10 15:52:51,917 |       Finished subset 16/36, 44.44 percent done
#> INFO     | 2020-01-10 15:52:51,918 |       Finished subset 17/36, 47.22 percent done
#> INFO     | 2020-01-10 15:52:51,919 |       Finished subset 18/36, 50.00 percent done
#> INFO     | 2020-01-10 15:52:51,920 |       Finished subset 19/36, 52.78 percent done
#> INFO     | 2020-01-10 15:52:51,921 |       Finished subset 20/36, 55.56 percent done
#> INFO     | 2020-01-10 15:52:51,923 |       Finished subset 21/36, 58.33 percent done
#> INFO     | 2020-01-10 15:52:51,924 |       Finished subset 22/36, 61.11 percent done
#> INFO     | 2020-01-10 15:52:51,925 |       Finished subset 23/36, 63.89 percent done
#> INFO     | 2020-01-10 15:52:51,927 |       Finished subset 24/36, 66.67 percent done
#> INFO     | 2020-01-10 15:52:51,929 |       Finished subset 25/36, 69.44 percent done
#> INFO     | 2020-01-10 15:52:51,931 |       Finished subset 26/36, 72.22 percent done
#> INFO     | 2020-01-10 15:52:51,932 |       Finished subset 27/36, 75.00 percent done
#> INFO     | 2020-01-10 15:52:51,933 |       Finished subset 28/36, 77.78 percent done
#> INFO     | 2020-01-10 15:52:51,934 |       Finished subset 29/36, 80.56 percent done
#> INFO     | 2020-01-10 15:52:51,935 |       Finished subset 30/36, 83.33 percent done
#> INFO     | 2020-01-10 15:52:51,938 |       Finished subset 31/36, 86.11 percent done
#> INFO     | 2020-01-10 15:52:51,940 |       Finished subset 32/36, 88.89 percent done
#> INFO     | 2020-01-10 15:52:51,944 |       Finished subset 33/36, 91.67 percent done
#> INFO     | 2020-01-10 15:52:51,947 |       Finished subset 34/36, 94.44 percent done
#> INFO     | 2020-01-10 15:52:51,949 |       Finished subset 35/36, 97.22 percent done
#> INFO     | 2020-01-10 15:52:51,950 |       Finished subset 36/36, 100.00 percent done
#> INFO     | 2020-01-10 15:52:51,951 |       Finding the best partitioning scheme
#> INFO     | 2020-01-10 15:52:51,958 |       Best scheme combines subsets: 'Gene1_pos1' and 'Gene3_pos1'
#> INFO     | 2020-01-10 15:52:51,958 |       The best scheme improves the aicc score by 12.91 to 10957.5
#> INFO     | 2020-01-10 15:52:51,959 |    ***Greedy algorithm step 2***
#> INFO     | 2020-01-10 15:52:51,960 |       Analysing 7 new subset pairs
#> INFO     | 2020-01-10 15:52:51,962 |       Finished subset 1/7, 14.29 percent done
#> INFO     | 2020-01-10 15:52:51,963 |       Finished subset 2/7, 28.57 percent done
#> INFO     | 2020-01-10 15:52:51,965 |       Finished subset 3/7, 42.86 percent done
#> INFO     | 2020-01-10 15:52:51,966 |       Finished subset 4/7, 57.14 percent done
#> INFO     | 2020-01-10 15:52:51,967 |       Finished subset 5/7, 71.43 percent done
#> INFO     | 2020-01-10 15:52:51,969 |       Finished subset 6/7, 85.71 percent done
#> INFO     | 2020-01-10 15:52:51,970 |       Finished subset 7/7, 100.00 percent done
#> INFO     | 2020-01-10 15:52:51,970 |       Finding the best partitioning scheme
#> INFO     | 2020-01-10 15:52:51,974 |       Best scheme combines subsets: 'Gene3_pos3' and 'Gene2_pos3'
#> INFO     | 2020-01-10 15:52:51,974 |       The best scheme improves the aicc score by 9.79 to 10947.7
#> INFO     | 2020-01-10 15:52:51,975 |    ***Greedy algorithm step 3***
#> INFO     | 2020-01-10 15:52:51,976 |       Analysing 6 new subset pairs
#> INFO     | 2020-01-10 15:52:51,977 |       Finished subset 1/6, 16.67 percent done
#> INFO     | 2020-01-10 15:52:51,979 |       Finished subset 2/6, 33.33 percent done
#> INFO     | 2020-01-10 15:52:51,980 |       Finished subset 3/6, 50.00 percent done
#> INFO     | 2020-01-10 15:52:51,981 |       Finished subset 4/6, 66.67 percent done
#> INFO     | 2020-01-10 15:52:51,982 |       Finished subset 5/6, 83.33 percent done
#> INFO     | 2020-01-10 15:52:51,984 |       Finished subset 6/6, 100.00 percent done
#> INFO     | 2020-01-10 15:52:51,984 |       Finding the best partitioning scheme
#> INFO     | 2020-01-10 15:52:51,987 |       Best scheme combines subsets: 'Gene3_pos2' and 'Gene1_pos2'
#> INFO     | 2020-01-10 15:52:51,987 |       The best scheme improves the aicc score by 7.37 to 10940.4
#> INFO     | 2020-01-10 15:52:51,988 |    ***Greedy algorithm step 4***
#> INFO     | 2020-01-10 15:52:51,989 |       Analysing 5 new subset pairs
#> INFO     | 2020-01-10 15:52:51,992 |       Finished subset 1/5, 20.00 percent done
#> INFO     | 2020-01-10 15:52:51,993 |       Finished subset 2/5, 40.00 percent done
#> INFO     | 2020-01-10 15:52:51,994 |       Finished subset 3/5, 60.00 percent done
#> INFO     | 2020-01-10 15:52:51,995 |       Finished subset 4/5, 80.00 percent done
#> INFO     | 2020-01-10 15:52:51,997 |       Finished subset 5/5, 100.00 percent done
#> INFO     | 2020-01-10 15:52:51,997 |       Finding the best partitioning scheme
#> INFO     | 2020-01-10 15:52:51,999 |       Best scheme combines subsets: 'Gene2_pos1' and 'Gene1_pos1, Gene3_pos1'
#> INFO     | 2020-01-10 15:52:52,000 |       The best scheme improves the aicc score by 5.60 to 10934.8
#> INFO     | 2020-01-10 15:52:52,001 |    ***Greedy algorithm step 5***
#> INFO     | 2020-01-10 15:52:52,002 |       Analysing 4 new subset pairs
#> INFO     | 2020-01-10 15:52:52,005 |       Finished subset 1/4, 25.00 percent done
#> INFO     | 2020-01-10 15:52:52,006 |       Finished subset 2/4, 50.00 percent done
#> INFO     | 2020-01-10 15:52:52,007 |       Finished subset 3/4, 75.00 percent done
#> INFO     | 2020-01-10 15:52:52,009 |       Finished subset 4/4, 100.00 percent done
#> INFO     | 2020-01-10 15:52:52,009 |       Finding the best partitioning scheme
#> INFO     | 2020-01-10 15:52:52,011 |       Found no schemes that improve the score, stopping
#> INFO     | 2020-01-10 15:52:52,012 |    Greedy algorithm finished after 5 steps
#> INFO     | 2020-01-10 15:52:52,012 |    Best scoring scheme is scheme step_4, with aicc score of 10934.756
#> INFO     | 2020-01-10 15:52:52,013 |    Information on best scheme is here: ./analysis/best_scheme.txt
#> INFO     | 2020-01-10 15:52:52,018 |    
#> INFO     | 2020-01-10 15:52:52,020 |    
#> INFO     | 2020-01-10 15:52:52,021 |    *Citations for this analysis*
#> INFO     | 2020-01-10 15:52:52,021 |    -----------------------------
#> INFO     | 2020-01-10 15:52:52,022 |    
#> INFO     | 2020-01-10 15:52:52,022 |    If you use this analysis in your published work, please cite the following papers on which your analysis relied.
#> INFO     | 2020-01-10 15:52:52,023 |    
#> INFO     | 2020-01-10 15:52:52,023 |    For the version of PartitionFinder you used, please cite:
#> INFO     | 2020-01-10 15:52:52,024 |    Lanfear, R., Frandsen, P. B., Wright, A. M., Senfeld, T., Calcott, B. (2016) PartitionFinder 2: new methods for selecting partitioned models of evolution formolecular and morphological phylogenetic analyses. Molecular biology and evolution. DOI: dx.doi.org/10.1093/molbev/msw260
#> INFO     | 2020-01-10 15:52:52,024 |    
#> INFO     | 2020-01-10 15:52:52,024 |    For the greedy algorithm you used, please cite:
#> INFO     | 2020-01-10 15:52:52,025 |    Lanfear, R., Calcott, B., Ho, S. Y., & Guindon, S. (2012). PartitionFinder: combined selection of partitioning schemes and substitution models for phylogenetic analyses. Molecular biology and evolution, 29(6), 1695-1701.
#> INFO     | 2020-01-10 15:52:52,025 |    
#> INFO     | 2020-01-10 15:52:52,025 |    Your analysis also used PhyML, so please cite:
#> INFO     | 2020-01-10 15:52:52,026 |    Guindon, S., Dufayard, J. F., Lefort, V., Anisimova, M., Hordijk, W., & Gascuel, O. (2010). New algorithms and methods to estimate maximum-likelihood phylogenies: assessing the performance of PhyML 3.0. Systematic biology, 59(3), 307-321.
#> INFO     | 2020-01-10 15:52:52,026 |    
#> INFO     | 2020-01-10 15:52:52,029 | Total processing time: 0:00:01 (h:m:s)
#> INFO     | 2020-01-10 15:52:52,029 | Processing complete.
```

### Morphology

``` r
library(outsider)
PartitionFinderMorphology <- module_import('PartitionFinderMorphology',
                                 repo = 'dombennett/om..partitionfinder')
example_fetch <- module_import('example_fetch',
                               repo = 'dombennett/om..partitionfinder')
# bring PartitionFinder examples to working directory
example_fetch(type = 'morphology')
# run on the "morphology" example folder
PartitionFinderMorphology(arglist = c('--raxml', 'morphology'))
#> INFO     | 2020-01-10 15:52:58,601 | ------------- PartitionFinderMorphology 2.1.1 -----------------
#> INFO     | 2020-01-10 15:52:58,601 | You have Python version 2.7
#> INFO     | 2020-01-10 15:52:58,601 | Command-line arguments used: /partitionfinder/PartitionFinderMorphology.py --raxml morphology
#> INFO     | 2020-01-10 15:52:58,601 | ------------- Configuring Parameters -------------
#> INFO     | 2020-01-10 15:52:58,602 | Setting datatype to 'morphology'
#> INFO     | 2020-01-10 15:52:58,602 | Setting phylogeny program to 'raxml'
#> INFO     | 2020-01-10 15:52:58,602 | Program path is here /partitionfinder/programs
#> INFO     | 2020-01-10 15:52:58,603 | Setting working folder to: '/working_dir/morphology'
#> INFO     | 2020-01-10 15:52:58,603 | Loading configuration at './partition_finder.cfg'
#> INFO     | 2020-01-10 15:52:58,607 | Setting 'alignment' to 'test.phy'
#> INFO     | 2020-01-10 15:52:58,608 | Setting 'branchlengths' to 'linked'
#> INFO     | 2020-01-10 15:52:58,609 | You set 'models' to: multistate+G
#> INFO     | 2020-01-10 15:52:58,618 | This analysis will use the following 1 models of molecular evolution
#> INFO     | 2020-01-10 15:52:58,619 | MULTISTATE+G
#> INFO     | 2020-01-10 15:52:58,619 | Setting 'model_selection' to 'bic'
#> INFO     | 2020-01-10 15:52:58,620 | Setting 'search' to 'kmeans'
#> INFO     | 2020-01-10 15:52:58,621 | ------------------------ BEGINNING NEW RUN -------------------------------
#> INFO     | 2020-01-10 15:52:58,621 | Looking for alignment file './test.phy'...
#> INFO     | 2020-01-10 15:52:58,621 | Using 2 cpus
#> INFO     | 2020-01-10 15:52:58,622 | Beginning Analysis
#> INFO     | 2020-01-10 15:52:58,632 | Reading alignment file './test.phy'
#> INFO     | 2020-01-10 15:52:58,634 | Starting tree will be estimated from the data.
#> INFO     | 2020-01-10 15:52:58,634 | Estimating Maximum Likelihood tree with RAxML fast experimental tree search for ./analysis/start_tree/filtered_source.phy
#> INFO     | 2020-01-10 15:52:58,637 | Using the model specified in the .cfg file
#> INFO     | 2020-01-10 15:53:07,678 | Estimating branch lengths on ML tree
#> INFO     | 2020-01-10 15:53:09,210 | ML topology estimation finished
#> INFO     | 2020-01-10 15:53:09,211 | Performing k-means Analysis
#> WARNING  | 2020-01-10 15:53:09,212 |    USE CAUTION: There is increasing evidence that the kmeans algorithm can lead to poor inferences, so we have discontinued its use for most data types (i.e. amino acid and nucleotide data). More information on the empirical issues can be found in this paper: http://www.sciencedirect.com/science/article/pii/S1055790316302780. We have kept the method available for morphological data, but warn users that the method is: experimental, untested on morphological data (either empirical or simulated), and may give incorrect topologies and branch lengths (see link to paper above).
#> INFO     | 2020-01-10 15:53:09,212 |    **Analysing starting scheme (scheme start_scheme)**
#> INFO     | 2020-01-10 15:53:10,328 |    ***k-means algorithm step 1***
#> INFO     | 2020-01-10 15:53:10,329 |       Splitting subsets using k-means
#> INFO     | 2020-01-10 15:53:11,059 |          Subset 1: 374 sites split into 196 and 178
#> INFO     | 2020-01-10 15:53:11,059 |       Calculating scores of all new subsets that can be analysed
#> INFO     | 2020-01-10 15:53:12,078 |          Subset 1: split changed BIC by: -972.5
#> INFO     | 2020-01-10 15:53:12,078 |       The bic score of 1 subset improved when split
#> INFO     | 2020-01-10 15:53:12,079 |    ***k-means algorithm step 2***
#> INFO     | 2020-01-10 15:53:12,079 |       Splitting subsets using k-means
#> INFO     | 2020-01-10 15:53:12,215 |          Subset 1: 196 sites not splittable
#> INFO     | 2020-01-10 15:53:12,321 |          Subset 2: 178 sites not splittable
#> INFO     | 2020-01-10 15:53:12,322 |       Calculating scores of all new subsets that can be analysed
#> INFO     | 2020-01-10 15:53:12,322 |       Could not improve bic score. Kmeans algorithm finished.
#> INFO     | 2020-01-10 15:53:12,323 |    Analysing final scheme
#> INFO     | 2020-01-10 15:53:12,323 |    ** Kmeans algorithm finished after 2 steps **
#> INFO     | 2020-01-10 15:53:12,324 |    Best scoring scheme has 2 subsets and a bic score of 15301.459
#> INFO     | 2020-01-10 15:53:12,325 |    Information on best scheme is here: ./analysis/best_scheme.txt
#> INFO     | 2020-01-10 15:53:12,326 |    
#> INFO     | 2020-01-10 15:53:12,326 |    
#> INFO     | 2020-01-10 15:53:12,327 |    *Citations for this analysis*
#> INFO     | 2020-01-10 15:53:12,327 |    -----------------------------
#> INFO     | 2020-01-10 15:53:12,328 |    
#> INFO     | 2020-01-10 15:53:12,329 |    If you use this analysis in your published work, please cite the following papers on which your analysis relied.
#> INFO     | 2020-01-10 15:53:12,329 |    
#> INFO     | 2020-01-10 15:53:12,330 |    For the version of PartitionFinder you used, please cite:
#> INFO     | 2020-01-10 15:53:12,330 |    Lanfear, R., Frandsen, P. B., Wright, A. M., Senfeld, T., Calcott, B. (2016) PartitionFinder 2: new methods for selecting partitioned models of evolution formolecular and morphological phylogenetic analyses. Molecular biology and evolution. DOI: dx.doi.org/10.1093/molbev/msw260
#> INFO     | 2020-01-10 15:53:12,331 |    
#> INFO     | 2020-01-10 15:53:12,331 |    For the kmeans algorithm you used, please cite:
#> INFO     | 2020-01-10 15:53:12,332 |    Frandsen, P. B., Calcott, B., Mayer, C., & Lanfear, R. (2015). Automatic selection of partitioning schemes for phylogenetic analyses using iterative k-means clustering of site rates. BMC Evolutionary Biology, 15(1), 13.
#> INFO     | 2020-01-10 15:53:12,332 |    
#> INFO     | 2020-01-10 15:53:12,333 |    Your analysis also used RAxML, so please cite:
#> INFO     | 2020-01-10 15:53:12,333 |    Stamatakis, A. (2014). RAxML version 8: a tool for phylogenetic analysis and post-analysis of large phylogenies. Bioinformatics, 30(9), 1312-1313.
#> INFO     | 2020-01-10 15:53:12,334 |    
#> INFO     | 2020-01-10 15:53:12,334 |    For the model of morphological evolution you used, please cite:
#> INFO     | 2020-01-10 15:53:12,335 |    Lewis, P. O. (2001). A likelihood approach to estimating phylogeny from discrete morphological character data. Systematic biology, 50(6), 913-925.
#> WARNING  | 2020-01-10 15:53:12,336 |    USE CAUTION: There is increasing evidence that the kmeans algorithm can lead to poor inferences, so we have discontinued its use for most data types (i.e. amino acid and nucleotide data). More information on the empirical issues can be found in this paper: http://www.sciencedirect.com/science/article/pii/S1055790316302780. We have kept the method available for morphological data, but warn users that the method is: experimental, untested on morphological data (either empirical or simulated), and may give incorrect topologies and branch lengths (see link to paper above).
#> INFO     | 2020-01-10 15:53:12,338 | Total processing time: 0:00:14 (h:m:s)
#> INFO     | 2020-01-10 15:53:12,338 | Processing complete.
```

### Protein

``` r
library(outsider)
PartitionFinderProtein <- module_import('PartitionFinderProtein',
                                        repo = 'dombennett/om..partitionfinder')
example_fetch <- module_import('example_fetch',
                               repo = 'dombennett/om..partitionfinder')
# bring PartitionFinder examples to working directory
example_fetch(type = 'aminoacid')
# run on the "aminoacid" example folder
PartitionFinderProtein(arglist = 'aminoacid')
#> INFO     | 2020-01-10 15:53:18,575 | ------------- PartitionFinderProtein 2.1.1 -----------------
#> INFO     | 2020-01-10 15:53:18,575 | You have Python version 2.7
#> INFO     | 2020-01-10 15:53:18,575 | Command-line arguments used: /partitionfinder/PartitionFinderProtein.py aminoacid
#> INFO     | 2020-01-10 15:53:18,576 | ------------- Configuring Parameters -------------
#> INFO     | 2020-01-10 15:53:18,576 | Setting datatype to 'protein'
#> INFO     | 2020-01-10 15:53:18,577 | Setting phylogeny program to 'phyml'
#> INFO     | 2020-01-10 15:53:18,577 | Program path is here /partitionfinder/programs
#> INFO     | 2020-01-10 15:53:18,578 | Setting working folder to: '/working_dir/aminoacid'
#> INFO     | 2020-01-10 15:53:18,578 | Loading configuration at './partition_finder.cfg'
#> INFO     | 2020-01-10 15:53:18,591 | Setting 'alignment' to 'test.phy'
#> INFO     | 2020-01-10 15:53:18,592 | Setting 'branchlengths' to 'linked'
#> INFO     | 2020-01-10 15:53:18,593 | You set 'models' to: LG+G, LG+I+G, WAG+G, WAG+I+G
#> INFO     | 2020-01-10 15:53:18,601 | This analysis will use the following 4 models of molecular evolution
#> INFO     | 2020-01-10 15:53:18,602 | LG+G, LG+I+G, WAG+G, WAG+I+G
#> INFO     | 2020-01-10 15:53:18,602 | Setting 'model_selection' to 'aicc'
#> INFO     | 2020-01-10 15:53:18,604 | Setting 'search' to 'greedy'
#> INFO     | 2020-01-10 15:53:18,605 | ------------------------ BEGINNING NEW RUN -------------------------------
#> INFO     | 2020-01-10 15:53:18,605 | Looking for alignment file './test.phy'...
#> INFO     | 2020-01-10 15:53:18,606 | Using 2 cpus
#> INFO     | 2020-01-10 15:53:18,606 | Beginning Analysis
#> INFO     | 2020-01-10 15:53:18,614 | Checking previously run configuration data...
#> INFO     | 2020-01-10 15:53:18,615 | Reading alignment file './test.phy'
#> INFO     | 2020-01-10 15:53:18,615 | Reading alignment file './analysis/start_tree/source.phy'
#> INFO     | 2020-01-10 15:53:18,617 | Starting tree file found.
#> INFO     | 2020-01-10 15:53:18,617 | Performing Greedy Analysis
#> INFO     | 2020-01-10 15:53:18,618 |    *** Analysing starting scheme ***
#> INFO     | 2020-01-10 15:53:18,622 |       Finished subset 1/3, 33.33 percent done
#> INFO     | 2020-01-10 15:53:18,623 |       Finished subset 2/3, 66.67 percent done
#> INFO     | 2020-01-10 15:53:18,624 |       Finished subset 3/3, 100.00 percent done
#> INFO     | 2020-01-10 15:53:18,625 |    ***Greedy algorithm step 1***
#> INFO     | 2020-01-10 15:53:18,626 |       Analysing 3 new subset pairs
#> INFO     | 2020-01-10 15:53:18,627 |       Finished subset 1/3, 33.33 percent done
#> INFO     | 2020-01-10 15:53:18,628 |       Finished subset 2/3, 66.67 percent done
#> INFO     | 2020-01-10 15:53:18,630 |       Finished subset 3/3, 100.00 percent done
#> INFO     | 2020-01-10 15:53:18,630 |       Finding the best partitioning scheme
#> INFO     | 2020-01-10 15:53:18,631 |       Best scheme combines subsets: 'COI' and 'COII'
#> INFO     | 2020-01-10 15:53:18,632 |       The best scheme improves the aicc score by 4.11 to 5642.7
#> INFO     | 2020-01-10 15:53:18,633 |    ***Greedy algorithm step 2***
#> INFO     | 2020-01-10 15:53:18,633 |       Analysing 1 new subset pairs
#> INFO     | 2020-01-10 15:53:18,635 |       Finished subset 1/1, 100.00 percent done
#> INFO     | 2020-01-10 15:53:18,635 |       Finding the best partitioning scheme
#> INFO     | 2020-01-10 15:53:18,636 |       Found no schemes that improve the score, stopping
#> INFO     | 2020-01-10 15:53:18,636 |    Greedy algorithm finished after 2 steps
#> INFO     | 2020-01-10 15:53:18,637 |    Best scoring scheme is scheme step_1, with aicc score of 5642.744
#> INFO     | 2020-01-10 15:53:18,637 |    Information on best scheme is here: ./analysis/best_scheme.txt
#> INFO     | 2020-01-10 15:53:18,638 |    
#> INFO     | 2020-01-10 15:53:18,639 |    
#> INFO     | 2020-01-10 15:53:18,639 |    *Citations for this analysis*
#> INFO     | 2020-01-10 15:53:18,639 |    -----------------------------
#> INFO     | 2020-01-10 15:53:18,640 |    
#> INFO     | 2020-01-10 15:53:18,640 |    If you use this analysis in your published work, please cite the following papers on which your analysis relied.
#> INFO     | 2020-01-10 15:53:18,640 |    
#> INFO     | 2020-01-10 15:53:18,641 |    For the version of PartitionFinder you used, please cite:
#> INFO     | 2020-01-10 15:53:18,641 |    Lanfear, R., Frandsen, P. B., Wright, A. M., Senfeld, T., Calcott, B. (2016) PartitionFinder 2: new methods for selecting partitioned models of evolution formolecular and morphological phylogenetic analyses. Molecular biology and evolution. DOI: dx.doi.org/10.1093/molbev/msw260
#> INFO     | 2020-01-10 15:53:18,642 |    
#> INFO     | 2020-01-10 15:53:18,642 |    For the greedy algorithm you used, please cite:
#> INFO     | 2020-01-10 15:53:18,642 |    Lanfear, R., Calcott, B., Ho, S. Y., & Guindon, S. (2012). PartitionFinder: combined selection of partitioning schemes and substitution models for phylogenetic analyses. Molecular biology and evolution, 29(6), 1695-1701.
#> INFO     | 2020-01-10 15:53:18,643 |    
#> INFO     | 2020-01-10 15:53:18,643 |    Your analysis also used PhyML, so please cite:
#> INFO     | 2020-01-10 15:53:18,643 |    Guindon, S., Dufayard, J. F., Lefort, V., Anisimova, M., Hordijk, W., & Gascuel, O. (2010). New algorithms and methods to estimate maximum-likelihood phylogenies: assessing the performance of PhyML 3.0. Systematic biology, 59(3), 307-321.
#> INFO     | 2020-01-10 15:53:18,643 |    
#> INFO     | 2020-01-10 15:53:18,644 | Total processing time: 0:00:00 (h:m:s)
#> INFO     | 2020-01-10 15:53:18,644 | Processing complete.
```

<!-- Remove module after running above example -->

## Links

Find out more by visiting the [PartitionFinder’s
homepage](www.robertlanfear.com/partitionfinder/).

## Please cite

  - Lanfear, R., Frandsen, P. B., Wright, A. M., Senfeld, T., Calcott,
    B. 2016 PartitionFinder 2: new methods for selecting partitioned
    models of evolution for molecular and morphological phylogenetic
    analyses. Molecular biology and evolution. DOI:
    dx.doi.org/10.1093/molbev/msw260
  - Bennett et al. (2020). outsider: Install and run programs, outside
    of R, inside of R. *Journal of Open Source Software*, In
review

## <!-- Footer -->

<img align="left" width="120" height="125" src="https://raw.githubusercontent.com/ropensci/outsider/master/logo.png">

**An `outsider` module**

Learn more at [outsider
website](https://docs.ropensci.org/outsider/). Want to build your
own module? Check out [`outsider.devtools`
website](https://docs.ropensci.org/outsider.devtools/).
