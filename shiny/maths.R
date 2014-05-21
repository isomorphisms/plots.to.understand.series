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


