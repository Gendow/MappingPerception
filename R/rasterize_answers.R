#Final Project Geo-Scripting Course, January 2015
#Team:CodeMan
#Date 26/10/2015
#This function Lists and rasterizes all files according to the questionnumber and creates a mosaic raster

#load libraries
library(raster)

#Define function
rasterize_answers <- function(path){ #argument path takes path to source data as a string
  #find number of input_data files
  length_data <- length(list.files(path = path, pattern=glob2rx('*.tif'), full.names = T))
  
  #List, rasterize, create a mosaic and export to disk
  for (questionnr in 1:length_data) {
    input_rasters <- lapply(list.files(path = path, pattern=glob2rx(sprintf('%s_*.tif', questionnr)), full.names = T), raster)
    
    #Multiple rasters output
    if (length(input_rasters) > 1) {
      print(sprintf("Rasterizing question %s...", questionnr))
      input_rasters$fun <- sum
      input_rasters$tolerance <- 20
      combined <- do.call(mosaic, input_rasters)
      combined[combined == 0] <- NA
      writeRaster(combined, filename = sprintf("R/Map-app/output/raster%s.tif", questionnr), format = "GTiff", overwrite = T)
      rm(combined)
      print(sprintf("Question %s has been calculated", questionnr))
    }
    
    #Single raster output
    if (length(input_rasters) == 1) {
      print(sprintf("Rasterizing question %s...", questionnr))
      single<-input_rasters[[1]]
      writeRaster(single, filename = sprintf("R/Map-app/output/raster%s.tif", questionnr), format = "GTiff", overwrite = T)
      print(sprintf("Question %s has been calculated", questionnr))
    }
  }
  print  ("Mosaic rasters have been saved to the disk")
}