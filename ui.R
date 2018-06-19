#
# developnig a shiny R app for predicting the miles per gallon
# using 2 different models 1: linear model[single variable horsepower]
# 2: linear model[multi variable, horsepower + weight + transmission type]

library(shiny)

# Define UI
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Miles per Gallon Prediction"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
        textInput("txt1", "Enter Your Car's Model", ""),
        sliderInput("sliderHP", "Enter Your Car's Horsepower", 50, 350, step = 5, value = 150),
        sliderInput("sliderWT", "Enter Your Car's Weight (per 1000 ibs)", 1, 10, value = 3.5, step = 0.01),
        radioButtons("rbTrans", "Select Your Car's Transmission Type", choices = c("Automatic", "Manual")),
        submitButton("Submit")
        ),
    # Show a plot of the generated distribution
    mainPanel(
        tabsetPanel(
                    tabPanel("Application", textOutput("carModel"),
                             plotOutput("plot1"), p(h4("Predicted Miles per Gallon from single-Variable Model")),
                             textOutput("pred1"), p(h4("Predicted Miles per Gallon from Multi-Variable Model")),
                             textOutput("pred2")
                             ),
                    tabPanel("Help",
                        helpText("This app is predicting the miles per gallon for cars, depending on 2 predction models"),
                        helpText("1st: linear model[single variable]"),
                        helpText("     using lm(MPG ~ HP) #prediction is based on the value of car's horsepower"),
                        helpText(""),
                        helpText("2nd: non-linear model[multi variable]"),
                        helpText("     using lm(MPG ~ HP + WT + factor(Trans) # prediction based on the value of"),
                        helpText(      "horsepower + weight (per 1000 ibs) + transmission type (Automatic / Manual)"),
                        helpText(" "),
                        helpText(" "),
                        helpText("by: Ahmed Talaat"),
                        helpText("    06 - 19 - 2018")
                    )
        )
    )
  )

))
