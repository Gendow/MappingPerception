#Team:CodeMan
#Date:26/01/2015
#ui.R of an app for plot an histogram and map depending on selected question
library(shiny)
library(raster)
library(plotGoogleMaps)
#generate layout
shinyUI(fluidPage(
  #layout title
  titlePanel(h2("Map the local citizen’s perception of the building environment of Lunetten")),
  
  #create widgets and histogram output
  sidebarLayout(
    sidebarPanel(
      helpText("Create an histogram per question.
               Each pixel represents 25 square meters."),
      
      selectInput("select", label = "Choose a question to display",
                  choices = c("Which area do you consider to be your living environment?",
                    "Which area do you find attractive?",
                    "Which area do you find non-attractive?",
                    "Which areas do you think are maintained well?",
                    "Which areas do you think are not maintained wel?",
                    "Which areas do you find relaxing/soothing?",
                    "Which areas do you find not relaxing/soothing?",
                    "Where are the good facilities?",
                    "Where do you feel safe?",
                    "Where do you experience noise hinderance?",
                    "where do you enjoy the green environment?"),
                  selected = "Which area do you consider to be your living environment?"),
      
      plotOutput("histPlot")),
    
    #create map outputs
    mainPanel(
      p("Final Project GRS51806 Geo-Scripting Course"),
      p("CodeMan team, Rony Nedkov and Samantha Martin del Campo"),
      p(a("Link to Github repository",href="https://github.com/Gendow/MappingPerception")),
      uiOutput("map"))
  )
))
