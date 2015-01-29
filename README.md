# MappingPerception

This script has been written for the GeoScripting course and is part of the final assignment.

Geo-challenge objective: Map the local citizen’s perception of the building environment of Lunetten

Data: is automatically downloaden when running the main script. In case the download function gives an error: manually
download the data by copying the link to dropbox in the main script and pasting it in a webbrowser.

The main.R script requires 10 to 20 minutes to completly run due to the use of the RasterToPolygon and mosiac function.

#Rasterize function
1. Takes the path to the location of the data as argument. 
2. The input data are single rasters which can have different extents. The rasters are listed according to the question number which is written in de filename.
3. The values of the listed rasters is summed up using a mosaic function.
4. The newly created mosaic raster is saved to the disk and deleted from the memory

#Map function
1. Takes the path to the location of the data as argument.
2. The input data are mosaic rasters created with the Rasterize function.
3. Rasters are converted to polygons and ploted in Google Maps.
4. Maps are saved as .html file

#Map app
1. Takes mosaic rasters and .html maps to construct a web app.
2. The app allows visualize results per question.
