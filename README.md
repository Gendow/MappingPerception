# MappingPerception

This script has been written for the GeoScripting course and is part of the final assignment.

Geo-challenge objective: Map the local citizen’s perception of the building environment of Lunetten

Data: is automatically downloaden when running the main script. In case the download function gives an error: manually
download the data by copying the link to dropbox in the main script and pasting it in a webbrowser.

#Rasterize function
1. Takes the path to the location of the data as argument. 
2. The input data are single rasters with different extents which are
  listed according to the question number which is written in de filename.
3. The values of the listed rasters is summed up using a mosaic function.
4. The newly created mosaic raster is saved to the disk and deleted from the memory


