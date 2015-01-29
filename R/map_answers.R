#Final Project Geo-Scripting Course, January 2015
#Team:CodeMan
#Date 26/01/2015
#This function creates maps in google Map

#load libraries
library(raster)
library(plotGoogleMaps)

#Define function
map_answers<-function(path){ #argument path takes path to source data as a string
  #Get mosaic rasters
  quest_file <- read.table("data/quest.txt",sep="\n") #Get question sentence
  
  #convert rasters to polygons
  for (questionnr in 1:13) {
    raster_path <- list.files(path = "R/Map-app/output", pattern=glob2rx(sprintf('raster%s.tif', questionnr)), full.names = T)
    
    if (length(raster_path) > 0) {
      input_raster <- raster(raster_path)
      names(input_raster)<-"Perception"
      data_poly <- rasterToPolygons(input_raster,na.rm=T, dissolve=T)
      data_poly@data$Question<-quest_file[[questionnr,1]] #set question sentence
      #Get number of participants
      answers_num <- length(list.files(path="data/", pattern=glob2rx(sprintf('%s_*.tif', questionnr)), full.names = T))
      data_poly@data$Participants<-answers_num #set number of participants
      #Set scale
      data_poly@data$Scale<-"Empty" #Set perception scale
      data_poly@data$Scale[data_poly@data$Perception==1|data_poly@data$Perception==2]<-"Poor"
      data_poly@data$Scale[data_poly@data$Perception==3|data_poly@data$Perception==4]<-"Fair"
      data_poly@data$Scale[data_poly@data$Perception==5|data_poly@data$Perception==6]<-"Good"
      data_poly@data$Scale[data_poly@data$Perception==7|data_poly@data$Perception==8]<-"Very Good"
      data_poly@data$Scale[data_poly@data$Perception==9|data_poly@data$Perception==10]<-"Excellent"
      #Get Map
      plotGoogleMaps(data_poly,layerName=paste("Question No.",questionnr),filename=paste0('R/Map-app/image/Map',questionnr,'.html'),
                     strokeWeight=0.01,openMap=F,colPalette=colorRampPalette(c("skyblue", "steelblue4"))(10),legend=F)
      print(sprintf('Map %s/%s ready', questionnr, 13))
    }
  }
  print ("Maps were created")
}  