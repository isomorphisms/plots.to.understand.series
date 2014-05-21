#pre stuff
#WEGERT STUFF
source("wegert setup.R")



#for plotting
#zoom = function(domain,zoom,shift) zoom * (domain - shift)




#SHINY STUFF


library(shiny)

shinyServer( function(input,output) {

    output$Wegert <- renderPlot({


	reactive({
		zoom<-exp(input$z)
		chroma<-input$c



	plat(zoom*Z, Airy, c=chroma)

		})#end reactive



		})#end render


})#end server
