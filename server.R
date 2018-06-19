#
# preparing our dataframe and making the required modeling 
#

library(shiny)
library(ggplot2)
library(datasets)

shinyServer(function(input, output) {
    # making the required dataframe 
    data("mtcars")
    cars <- data.frame(MPG = mtcars$mpg, HP = mtcars$hp, WT = mtcars$wt, 
                       Trans = ifelse(mtcars$am == 0, "Automatic", "Manual"))
    
    #fitting a linear model [single variable]
    sngModel <- lm(MPG ~ HP, data = cars)
    
    #fitting a nonlinear model [mlulti variable]
    mulModel <- lm(MPG ~ HP + WT + factor(Trans), data = cars)
    
    #predicting new value
    sngPred <- reactive({
        hpInput <- input$sliderHP
        wtInput <- input$sliderWT
        transInput <- input$rbTrans
        
        predict(sngModel, newdata = data.frame(HP = hpInput))
    })
    
    mulPred <- reactive({
        hpInput <- input$sliderHP
        wtInput <- input$sliderWT
        transInput <- input$rbTrans
        
        predict(mulModel, newdata = data.frame(HP = hpInput,
                                               WT = wtInput,
                                               Trans = transInput))
    })
    
    output$carModel <- renderText({
        paste("Your Car's Model is : ", input$txt1)
    })
    
    output$plot1 <- renderPlot({
        hpInput <- input$sliderHP
        wtInput <- input$sliderWT
        transInput <- input$rbTrans
        
        qplot(data = cars, x = HP, y = MPG, color = factor(Trans),
              size = WT) + 
            labs(x = "Horsepowe", y = "Miles per Gallon") +
            geom_abline(slope = sngModel$coefficients[2], intercept = sngModel$coefficients[1]
                        , color = "blue", size = 1) + 
            geom_line(data = cars, aes(x = HP, y = predict(mulModel, newdata = cars))
                      , color = "orange", size = 1) + 
            geom_point(aes(x = input$sliderHP, y = sngPred()), color = "blue", size = input$sliderWT * 2) +
            geom_point(aes(x = input$sliderHP, y = mulPred()), color = "orange", size = input$sliderWT * 2)
        
    })
    
    output$pred1 <- renderText({
        round(sngPred(), 3)
    })
    
    output$pred2 <- renderText({
        round(mulPred(), 3)
    })
    
})
