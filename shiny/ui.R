library(shiny)

# Define UI
shinyUI(fluidPage(

titlePanel("Wegert-style function plotter, à la http://arxiv.org/abs/1007.2295"),

 
# Sidebar with a slider input for the number of bins
 sidebarLayout(
   sidebarPanel(

		p("Elias Wegert has written a remarkable book called", a("Visual Complex Functions", href="http://visual.wegert.com"), ". Using the methods outlined in his book and articles, you can turn ugly runic algebra", br(), br(), img(src="https://upload.wikimedia.org/math/3/e/1/3e1976b675e8b6f718f5996ab1212baa.png"), br(), br(), img(src="https://upload.wikimedia.org/math/e/a/6/ea609f6da3bee77ef5351f2409acf6b6.png"), br(), br(), "into an appealing visual. The phase-plot method draws attention to the qualitative features of a function."),
	
		br(),


      sliderInput("c",
		  "Chroma",
		  min = 1, max = 99,
		  value = 35
		  ),
    sliderInput("z",
		"log(Zoom)",
		min=-5,max=5,
		value = 0),

    sliderInput("l",
		"Lightness",
		min=50,max=80,value=70),

	
		br(),

		
	p("This is an implementation of Wegert's plotting method in", code("R"), ". Through this plotting technique you can see series or ", a("special functions", href="http://dlmf.nist.gov/"), " with your right brain.", br(), img(src="http://amelott.files.wordpress.com/2011/04/right-brain.jpg"), br(), "With this holistic view it's easier to think about the Taylor decomposition, Fourier decomposition, or any infinite-dimensional basis for series. All of this is simply moving various sliders up and down and watching a curve wiggle. The practical side of series is that real-world functions may not look anything like functions you learned in school (x², sine)—but they", em("can"), "be built up out of those functions. Surprising!"),

br(),

      p("Take a look at some scary special functions such as the Riemann Zeta (two different low-N approximations: one with products of primes and one with sums of ℕ), Airy function, and ratios of polynomials. You should notice poles and zeroes of the polynomials and very strange/interesting behaviour of the special functions.")

		),


# Show a plot of the generated distribution
mainPanel(
selectInput("fun", "Choose a pre-defined function:", 
	      choices = c("a polynomial", "another polynomial", "a ratio of polynomials", "The Airy function", "Riemann zeta, ∫ approximation", "hyperbolic cosine")),
br(),
    h3(textOutput("formula")),
    h2("Wegert plot (ℂ)"),
    plotOutput("Wegert", width="600px", height="600px"),
    h2('wiggly plot (ℝ)'),
    plotOutput("wiggly")
    )
)
))
