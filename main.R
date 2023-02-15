#!/usr/bin/env Rscript

# check if sf is installed an load it
if(!"sf" %in% installed.packages()){install.packages("sf")}
library(sf)

# output_dir = 'output'
# if (!dir.exists(outpit_dir)){
#   dir.create(output_dir)
# }


source('R/getData.R')

data <- getData('France', adm_level = 2, format = 'json')
