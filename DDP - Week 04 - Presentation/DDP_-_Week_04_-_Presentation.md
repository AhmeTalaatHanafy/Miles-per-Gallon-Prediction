---
title: "MILES per GALLON PREDICTION"
author: "Ahmed Talaat Hanafy"
date: "June 19, 2018"
output: 
  slidy_presentation: 
    fig_caption: yes
    keep_md: yes
---

##Overview:

*This is an RStudio shiny application developed as a part of final project in the Developing Data Products course in Coursera Data Science Specialization track. Application is [MILES per GALLON PREDICTOR](https://goo.gl/duYPCd)

**Application includes:**
    
* A number of sliders to select different variables.

* A raioButton to select the Transmission type.

* 2 Tabs to show the app & documentation.



##Widgets:

This app uses **5 widgets** listed below:

* textInput: a field to enter your car's model, it takes any text values.

* 2 sliderInputs: 

    slider #1: to enter the horsepower of your car.
    slider #2: to enter the weight of your car (per 1000 ibs)
    
* radioButton: to select your car's transmission type (Automatic / Manual)

* actionButton: a submit button, to provide a slow reactive activity for model.


##Calculations:

The reactivity of the shiny application widgets is controlled by using an Action Button. Based on user inputs, and using lm() function, the application displays:

* Car's Model

* Predicted value of MPG using the Linear Model

* Predicted value of MPG using the Non-Linear Model

* Plot shows how are the 2 models on a visualizing scale

To make it easy for a novice user, a Documentation tab in the Main Panel of the application lists the details of the calculation of simple interest.


##Links

* find the application at [link](https://goo.gl/duYPCd)

* find all project files at **Github** repo [link](https://github.com/AhmeTalaatHanafy/Miles-per-Gallon-Prediction.git)


by: Ahmed Talaat Hanafy

    THANKS


