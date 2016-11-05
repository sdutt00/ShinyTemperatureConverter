# A Temperature conversion Shiny app
library(shiny)

shinyUI(
  # multi-page user-interface with a navigation bar.  
  navbarPage("A simple Temperature Conversion Application",
  # Tab Panel where the interactive work is performed        
  tabPanel("Temperature Conversion",

  sidebarLayout(
    sidebarPanel(
      #Slider to input temperature for conversion and radio button to select type
      h3("Move the slider to input temperature"),
      sliderInput("slider1", "Input Temperature", -150, 150, 0),
      radioButtons("convType","Select the Conversion Type:", 
                   c("Celsius->Fahrenheit"="C2F", "Fahrenheit->Celsius" = "F2C"))
    ),
    #Main Panel will display the text values and chart of the temperatures
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
  )),
 #Another Tab that displays documentation about the Application
 tabPanel("About",
          mainPanel(
            includeMarkdown("about.md")
          )
 ) # end of "About" tab panel
 
)
)