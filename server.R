library(shiny)
shinyServer(function(input, output) {

  inpProcess <- reactive({
    inType <- ifelse(input$convType=="C2F","deg Celsius","deg Fahrenheit")
  })
  
  outTypeProcess <- reactive({
    outType <- ifelse(input$convType=="C2F","deg Fahrenheit","deg Celsius")
  })
  
  outTemProcess <- reactive({
    outTemp <- ifelse(input$convType=="C2F",
                      round((9.0/5.0)*input$slider1 + 32,1),
                      round((5.0/9.0)*(input$slider1 - 32),1))
  })
  
  output$inptext <- renderText({
    c(input$slider1, inpProcess())
     })

  output$outtext <- renderText({
    c(outTemProcess(), outTypeProcess())
  })
  
  output$plot1 <- renderPlot({
        inT <- input$slider1
        outT <- outTemProcess()
        barplot(c(inT,outT), col=c("blue","red"), names.arg = c(inpProcess(),outTypeProcess()),
                ylab="Temperature",
                main="Temperature Conversion between Celsius and Fahrenheit")
   })
})