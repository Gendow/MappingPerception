#Final Project Geo-Scripting Course, January 2015
#Team:CodeMan
#Date 26/10/2015
#Project: Map the local citizen’s perception of the building environment of Hoensbroek

#Install and call require packages
if(!require(plotgoogleMaps))
  install.packages("plotGoogleMaps")
if(!require(xts))
  install.packages("xts")
if(!require(shiny))
  install.packages("shiny")
if(!require(downloader))
  install.packages("downloader")

library(raster)
library(plotGoogleMaps)
library(shiny)
library(downloader)

source("R/rasterize_answers.R")
source("R/map_answers.R")


#Download data
download("https://www.dropbox.com/s/368de9fw3szw9ai/12map_data_lunetten.zip?dl=0", destfile = "data/12map_data_lunetten.zip")
unzip("data/12map_data_lunetten.zip", exdir = "data/")

#Get data 
rasterize_answers("data/")

#Create Maps
map_answers("R/Map-app/output")

#create app
runApp("R/Map-app")
