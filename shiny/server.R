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
		zoom<-input$z,
		chroma<-input$c,



	plat(22*Z, Airy, c=chroma)

		})#end reactive



		})#end render


})#end server
