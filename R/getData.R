
getData <- function(country, adm_level=1, format='json') {
  #' !!!
  #' 
  
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
                          'kmz' = '.kmz',
                          'gpkg' = '.gpkg')
  
  data_url <- paste0('https://geodata.ucdavis.edu/gadm/gadm4.1/',
                     format,
                     '/gadm41_',
                     country_code, format_endstring)

  download.file(url = data_url, destfile = file.path(output_dir, 'gadm_data.zip'))
      unzip(paste0(output_dir, '/gadm_data.zip'), exdir = output_dir)
  
  unlink(paste0(output_dir, '/gadm_data.zip'))
}


