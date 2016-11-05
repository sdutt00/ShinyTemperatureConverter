# A Temperature conversion Shiny app
library(shiny)
shinyUI(fluidPage(
  titlePanel("A simple Temperature Conversion Application"),
  br(),
  sidebarLayout(
    sidebarPanel(
      h3("Move the slider to input temperature"),
      sliderInput("slider1", "Input Temperature", -150, 150, 0),
      radioButtons("convType","Select the Conversion Type:", 
                   c("Celsius->Fahrenheit"="C2F", "Fahrenheit->Celsius" = "F2C"))
    ),
    mainPanel(
      h3("Input Temperature: "),
      textOutput("inptext"),
      tags$head(tags$style("#inptext{color: blue;
                                 font-size: 24px;
                           font-style: bold;
                           }"
                         )
      ),
      h3("Output Temperature: "),
      textOutput("outtext"),
      tags$head(tags$style("#outtext{color: red;
                                 font-size: 24px;
                           font-style: bold;
                           }"
                         )
      ),
      plotOutput("plot1")
    )
  )
))