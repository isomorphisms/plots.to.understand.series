library(shiny)

# Define UI
shinyUI(fluidPage(

titlePanel("Wegert-style function plotter, à la http://arxiv.org/abs/1007.2295"),

 
# Sidebar with a slider input for the number of bins
 sidebarLayout(
   sidebarPanel(

		p("Elias Wegert has written a remarkable book called", a("Visual Complex Functions", href="http://visual.wegert.com"), ". Using the methods outlined in his book and articles, you can turn ugly runic algebra into an appealing visual. The phase-plot method draws attention to the qualitative features of a function."),
		p('This is an implementation of Wegert's plotting method in", code("R"), ". Through this plotting technique you can see series or ", a("special functions", href="http://dlmf.nist.gov/"), " with your right brain.", br(), img(src="http://amelott.files.wordpress.com/2011/04/right-brain.jpg"), br(), "With this holistic view it's easier to think about the Taylor decomposition &ndash;vs&ndash; Fourier decomposition or any infinite-dimensional basis for series. All of this is simply moving various sliders up and down and watching a curve wiggle. The practical side of series is that real-world functions may not look anything like functions you learned in school (x&sup2;, sine)&mdash;but they <i>can</i> be built up out of those functions. Surprising!'),
		  p("Take a look at some scary special functions such as the Riemann Zeta (two different low-N approximations: one with products of primes and one with sums of &Nopf;), Airy function, and ratios of polynomials. You should notice poles and zeroes of the polynomials and very strange/interesting behaviour of the special functions."),



      sliderInput("c",
		  "Chroma",
		  min = 1, max = 99,
		  value = 35
		  ),
    sliderInput("z",
		"Zoom",
		min=.01,max=50,
		value = 1)
		),

# Show a plot of the generated distribution
mainPanel(
    plotOutput("Wegert")
    )
)
))