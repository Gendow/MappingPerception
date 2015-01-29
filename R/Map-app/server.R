#Team:CodeMan
#Date:26/01/2015
#server.R of an app for plot an histogram and map depending on selected question
library(shiny)
library(raster)
library(plotGoogleMaps)
rasterFiles<-lapply(list.files(path="output/",pattern = glob2rx('raster*.tif'),full.names=T),raster)
names(rasterFiles)<-list.files(path="output/",pattern =glob2rx('raster*.tif'))

shinyServer(function(input, output) {
  
  output$histPlot<-renderPlot({
    raster<-switch(input$select,
                   "Which area do you consider to be your living environment?"=rasterFiles$raster2,
                   "Which area do you find attractive?"=rasterFiles$raster3, 
                   "Which area do you find non-attractive?"=rasterFiles$raster4,
                   "Which areas do you think are maintained well?"=rasterFiles$raster5, 
                   "Which areas do you think are not maintained wel?"=rasterFiles$raster6,
                   "Which areas do you find relaxing/soothing?"=rasterFiles$raster7, 
                   "Which areas do you find not relaxing/soothing?"=rasterFiles$raster8,
                   "Where are the good facilities?"=rasterFiles$raster9, 
                   "Where do you feel safe?"=rasterFiles$raster11, 
                   "Where do you experience noise hinderance?"=rasterFiles$raster12,
                   "where do you enjoy the green environment?"=rasterFiles$raster13)
    
    valuetable<-getValues(raster)
    valuetable[valuetable==0]<-NA
    valuetable <- na.omit(valuetable)
    valuetable <- as.data.frame(valuetable)
      
    bins <- seq(min(valuetable), max(valuetable))
      
    hist(valuetable[,1], breaks = bins, col = 'darkblue', border = 'white',main="Histogram",xlab="Perception",xlim=c(0,50))
    
  })#Hist
  
  output$map<-renderUI({
    mapFile<-switch(input$select,
                    "Which area do you consider to be your living environment?"="image/Map2.html", 
                    "Which area do you find attractive?"="image/Map3.html", 
                    "Which area do you find non-attractive?"="image/Map4.html", 
                    "Which areas do you think are maintained well?"="image/Map5.html",  
                    "Which areas do you think are not maintained wel?"="image/Map6.html", 
                    "Which areas do you find relaxing/soothing?"="image/Map7.html",  
                    "Which areas do you find not relaxing/soothing?"="image/Map8.html", 
                    "Where are the good facilities?"="image/Map9.html",  
                    "Where do you feel safe?"="image/Map11.html", 
                    "Where do you experience noise hinderance?"="image/Map12.html", 
                    "where do you enjoy the green environment?"="image/Map13.html", )
    
    tags$iframe(srcdoc=paste(readLines(mapFile), collapse = '\n')
                ,width = "100%",height = "600px")
  })#Map
})#final