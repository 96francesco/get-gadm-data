# getData.R
# Repository: get-gadm-data
# Author: Francesco Pasanisi

getData <- function(country, adm_level=1, format='json') {
  #' Download file from the GADM database related to the
  #' selected country, with the specifies administrative level
  #' and extension. It creates a folder 'output' if it does not 
  #' exist in the working directory.
  #' @param country character that contains the name of the country of interest
  #' @param adm_level optional integer to select the administrative level
  #' @param format optional character to specify the desired output format
  #' @return integer of length 0
  #' @examples 
  getData('Italy', 2, 'kmz')
  
  output_dir = 'output'
  if (!dir.exists(output_dir)) {
    dir.create(output_dir)
  }
  
  iso_codes <- read.csv('iso_codes.csv')
  
  # column 3 of ISO dataset has the 3 characters codes
  country_code <- iso_codes[iso_codes$name == country, 3]
  
  # change the final part of URL string according to file format
  format_endstring <- switch(format,
                          'json' = paste0('_', as.character(adm_level), '.json.zip'),
                          'shp' = "_shp.zip",
                          'kmz' = paste0('_', as.character(adm_level), '.kmz'),
                          'gpkg' = '.gpkg')
  
  data_url <- paste0('https://geodata.ucdavis.edu/gadm/gadm4.1/',
                     format,
                     '/gadm41_',
                     country_code, format_endstring)

  download.file(url = data_url, destfile = file.path(output_dir, 'gadm_data.zip'))
      unzip(paste0(output_dir, '/gadm_data.zip'), exdir = output_dir)
  
  unlink(paste0(output_dir, '/gadm_data.zip'))
}


