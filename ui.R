
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Predict wine quality"),
  sidebarLayout(
    sidebarPanel(
      helpText("Adjust the sliders to the resulting values by your physicochemical tools."),
      radioButtons(inputId="color", label = h4("Wine Color"),
                          choices = list("Red", "White"), 
                          selected ="Red"),
      sliderInput("fixed.acidity", label=h4("Fixed Acidity:"), value=7.9, min=0, max=20, step=0.1),
      sliderInput("volatile.acidity", label=h4("Volatile Acidity:"), value = 0.35, min=0, max = 2, step=0.05),
      sliderInput("citric.acid", label=h4("Citric Acid:"), value=0.45, min=0, max=1, step=0.05),
      sliderInput("residual.sugar", label=h4("Residual Sugar:"), value=3.6, min=0, max=16, step=0.1),
      sliderInput("chlorides", label=h4("Chlorides:"), value=0.08, min=0, max=1, step=0.01),
      sliderInput("free.sulfur.dioxide", label=h4("Free Sulfur Dioxide:"), value=15, min=0, max=75, step=1),
      sliderInput("total.sulfur.dioxide", label=h4("Total Sulfur Dioxide:"), value=37, min=0, max=300, step=1),
      sliderInput("density", label=h4("Density:"), value=0.99, min=0.5, max=1.1, step=0.01),
      sliderInput("pH", label=h4("pH:"), value=3.35, min=0, max=7, step=0.05),
      sliderInput("sulphates", label=h4("Sulphates:"), value=0.85, min=0, max=3, step=0.05),
      sliderInput("alcohol", label=h4("Alcohol:"), value=12.8, min=5, max=16, step=0.2)
    ),
    mainPanel(
      h3("This wine quality will be:"),
      verbatimTextOutput("pred"),
      h3("Model Info:"),
      verbatimTextOutput("model")
    )
  )
))
