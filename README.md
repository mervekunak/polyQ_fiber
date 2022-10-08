# This repository contains the main data analysis and plotting codes I use for my masters thesis. <br />

turn_GLN_ids_3turn.py file computes each residue number of the beta turns. These residues will not be used in analyzing the system. <br />
The output is used in the mycommands.sh file in the "gmx make_ndx" command
##
mycommands.sh file is used for energy and chi dihedral analysis for each simulation carried out.
#
analysis.ipynb jupyter notebook file is used to further analyze and compare the energy terms, chi dihedrals of the systems. <br />
This file contains both python and bash commands.
# 
chi13plotting.sh is used to plot of all data points of chi1 vs chi3 in gnuplot of each simulation
# 
Further explanation may be found inside each code files
