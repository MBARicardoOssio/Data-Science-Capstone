#
# Coursera Data Science Capstone - Final Project
# Ricardo a Garcia Osio, December 07, 2020
#

# load libraries, suppress metadata
suppressPackageStartupMessages(c(
  library(stringr),
  library(stylo),
  library(tm)
  ))

# include helper functions
source("./predict.R")

# word prediction service
shinyServer(function(input, output) {
  nextWord <- reactive({
    t <- input$text
    tt <- reFreshen(t)
    wCount <- length(tt)
    nextWord <- getNextWord(wCount,tt)})
  
  output$nextWords <- renderPrint(nextWord())
  output$inputWords <- renderText({input$text}, quoted = FALSE)
  
})

