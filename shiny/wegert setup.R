
#ℂ to pull back onto
i = complex(imaginary=1)
M = matrix(1:100,100,100)	#grid
M <- M * i/20 + t(M)/20		#twist & shout
M <- M - complex(real=2.5,imaginary=2.5)	#recentre

#bigger
Z = matrix(1:500,500,500)	#thicker grid
Z = Z*i/100 + t(Z)/100		#twist & shout
Z = Z - complex(real=2.5,imaginary=2.5)	#recentre

#bigger bigger
Z = matrix(1:1e3,1e3,1e3)
Z = Z*i/200 + t(Z)/200
Z = Z - complex(real=2.5,imaginary=2.5)


#convenience functions
arg = function(z) (Arg(z)+pi)/2/pi*360	#for HCL colour input
#ring = function(C) C[.8 < Mod(C) & Mod(C) < 1.2]	#focus on unit disk
lev = function(x) ceiling(log(x)) - log(x)	#IMPORTANT (rounding)
m = function(z) lev(Mod(z))

#put it all together, accept arguments
plat = function(domain,FUN, c=35, cex=1.5, pch=46) {
    plot( domain, col=hcl(
			  h=arg(FUN(domain)),	#main plot
			  l=70+m(domain)
			  ),
	 pch=pch,
	 cex=cex,


	 main=substitute(FUN)	#name plot after function name


	 )
}


#seed with some interesting functions
Riemann.Zeta.Plus.Side = function(x,n=10^5) sum( 1/n^x)
require(sfsmisc)	#has primes
Riemann.Zeta.Product.Side = function(x,n=10^5) prod( 1-primes(n)^x )
Dilogarithm = function(M) integrate( function(t) -log(1-t)/t, 0, M)
Airy = function(x) exp(-2/3*x^1.5) / 2 / sqrt(pi) / x^.25

polynomial.1 = function(x) x^3 + 5*x^2 - 2*x+i
polynomial.2 = function(x) x^4/14 + x^3/13
polynomial.1.2 = function(x) polynomial.1(x) / polynomial.2(x)
polynomial.2.1 = function(x) polynomial.2(x) / polynomial.1(x)
polynomial.222.11 = function(x) polynomial.2(x)^3 / polynomial.1(x)^2


