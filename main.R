#!/usr/bin/env Rscript

# main.R
# Repository: get-gadm-data
# Author: Francesco Pasanisi

# check if sf is installed an load it
if(!"sf" %in% installed.packages()){install.packages("sf")}
library(sf)

# set arguments
args <- commandArgs(trailingOnly = T)
country <- args[1]
level <- args[2]
ext <- args[3]

# source and execute download
source('R/getData.R')
getData(country, level, ext)
