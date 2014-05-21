#pre stuff
source("wegert setup.R")



#for plotting
#zoom = function(domain,zoom,shift) zoom * (domain - shift)

select.a.function = function(input=input$fun)  {
    switch(input,
	   "a polynomial"<<-polynomial.1,
	   "another polynomial"<<-polynomial.2,
	   "a ratio of polynomials"<<-polynomial.1.2,
	   "The Airy function"<<-Airy,
	   "Riemann zeta, + approximation"<<-Riemann.Zeta.Plus.Side ,
	   "Riemann zeta, × approximation"<<-Riemann.Zeta.Product.Side
	   )

}




#SHINY STUFF


library(shiny)

shinyServer( function(input,output) {

    output$Wegert <- renderPlot({

	reactive({
	#read in values from user
		zoom<-exp(input$z)
		chroma<-input$c
		select.a.function(input$fun)
		       
	#make complex output
	plat(zoom*Z, fun, c=chroma)


		})#end reactive
		})#end render


#    output$wiggly <- renderPlot({
#
#	reactive({
#	#read in values from user
#		zoom<-exp(input$z)
#		select.a.function(input$fun)
#		       
#
#	#make real output
#	plot(fun, -zoom,zoom)
#
#
#	)}#end reactive
#
    #    })#end render

})#end server
