
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(RcppEigen)
library(randomForest)
library(caret)

load('redwines.model.rda')
load('whitewines.model.rda')

shinyServer(function(input, output) {
  observe({
    input.data <- reactive({
      df <- data.frame(fixed.acidity=input$fixed.acidity,
                       volatile.acidity = input$volatile.acidity,
                       citric.acid = input$citric.acid,
                       residual.sugar = input$residual.sugar,
                       chlorides = input$chlorides,
                       free.sulfur.dioxide = input$free.sulfur.dioxide,
                       total.sulfur.dioxide = input$total.sulfur.dioxide,
                       density = input$density,
                       pH = input$pH,
                       sulphates = input$sulphates,
                       alcohol = input$alcohol)
      return(list(df=df))
    })
    input.dataFrame <- input.data()$df
    
    if ("Red" == input$color){
      model <- redwines.model
    }else if ("White" == input$color){
      model <- whitewines.model
    }
    prediction <- predict(model, newdata=input.dataFrame)
    output$pred <- renderText(ifelse(prediction=="great", "Great", ifelse(prediction=="poor", "Poor", "Standard")))
    output$model <- renderPrint(model)
  })
})
