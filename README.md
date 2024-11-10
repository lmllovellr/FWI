# FWI
# This is a method to mine key nodes in multilayer networks by fuzzy weighted approach.

The code was run on MATLAB 2016a.

The main file is main.m, just run it to get the results.

The final result obtained is made up of FWI_HD score, FWI_HD rank, FWI_KL score, FWI_KL rank, FWI score, FWI rank, KsGC score, KsGC rank, HKS score, HKS rank, GML score, GML rank, Lfic score, Lfic rank.

The Monotonicity_function.m can get the results in Table 3 by calling the resultant data from the run. Due to the large data memory, only two data are uploaded here, that is Arabidopsis_Multiplex_Genetic and Celegans_Multiplex_Genetic.

The Frequency.m can get Figure 5 by the data Arabidopsis_Multiplex_Genetic and Celegans_Multiplex_Genetic.

The Cumulative_distribution_function.m can get Figure 6-8 by the data Arabidopsis_Multiplex_Genetic and Celegans_Multiplex_Genetic, and deal with them into overlapping network, aggregation network and local aggregation network, respectively.
