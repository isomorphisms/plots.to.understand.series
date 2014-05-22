#MATH STUFF
source("wegert setup.R")



#for plotting
#zoom = function(domain,zoom,shift) zoom * (domain - shift)

select.a.function = function(input=input$fun)  {
    switch(input,
	   "a polynomial"=polynomial.1,
	   "another polynomial"=polynomial.2,
	   "a ratio of polynomials"=polynomial.1.2,
	   "The Airy function"=Airy,
	   "Riemann zeta, ∫ approximation"=zeta
	   )

}




#SHINY STUFF


library(shiny)

shinyServer( function(input,output) {


#read in user input knobs
control.knobs <- reactive({

fun<<-    switch(input$fun,
	   "a polynomial"=polynomial.1,
	   "another polynomial"=polynomial.2,
	   "a ratio of polynomials"=polynomial.1.2,
	   "The Airy function"=Airy,
	   "Riemann zeta, ∫ approximation"=zeta,
	   "hyperbolic cosine"=cosh
	   )
	
#fun<<-Airy
zoom<<-exp(input$z)
chroma<<-input$c
lightness<<-input$l

		})#end reactive

	#left brain: spit out the formula
output$formula = renderText({ paste("formula for", format(fun)[1], "is:", format(fun)[2]) })


    #make complex output
    output$Wegert <- renderPlot({
	control.knobs()

	plat(zoom*Z, fun, c=chroma, lightbase=lightness)

		})#end render



    #make real output
    output$wiggly <- renderPlot({
	control.knobs()

	plot(fun, -2*zoom, 2*zoom, lwd=3, col=rgb(.1,.1,.1,.9) )

		})#end render
})#end server
