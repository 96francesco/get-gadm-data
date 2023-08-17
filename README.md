[![License: GPL-3.0](https://img.shields.io/github/license/96francesco/suitabox-arcgis)](https://opensource.org/licenses/GPL-3.0)

## GADM data download

Quickly download the data from the Database of Global Administrative Areas (GADM), with the desired administration level of the selected country.
As this script uses the [sf](https://github.com/r-spatial/sf) package, it requires GDAL, GEOS and PROJ to be executed properly.


Through a Bash terminal, clone the repository

```
git clone git@github.com:96francesco/get-gadm-data.git
```

Move to the cloned project folder

```
cd get-gadm-data
```

Execute the R script indicating the country (between quotes), the administrative leve (0, 1, or 2, depending on the country) and the desired output extension (between quotes - json, kmz, gpkg or shp). For instance, to download Italian province borders as JSON file:

```
Rscript main.R 'Italy' 2 'json'
```

The downloaded will be placed in the folder get-gadm-data/output.
