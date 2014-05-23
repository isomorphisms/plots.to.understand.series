#seed with some interesting functions
i = complex(imaginary=1)
Dilogarithm = function(M) integrate( function(t) -log(1-t)/t, 0, M)
Airy = function(x) exp(-2/3*x^1.5) / 2 / sqrt(pi) / x^.25
Airy.plus = function(x) Airy(x) + x
Airy.sinh = function(x) Airy(x) + sinh(x)
zeta = function(x,M=1e9) (1-x)*( M**(1-x) - 1)
Lorentz = function(x) 1/sqrt(1-x*x)

polynomial.1 = function(x) x^3 + 5*x^2 - 2*x+i
polynomial.2 = function(x) x^4/14 + x^3/13
polynomial.1.2 = function(x) polynomial.1(x) / polynomial.2(x)
polynomial.2.1 = function(x) polynomial.2(x) / polynomial.1(x)
polynomial.222.11 = function(x) polynomial.2(x)^3 / polynomial.1(x)^2

seed=c(complex(argument=3,modulus=1), complex(argument=2,modulus=.5), 5, exp(i*.3)/.6,complex(argument=.1,modulus=.7))
rot=complex(modulus=1,argument=.1)
Blaschke = function(x,k=seed,const=rot) prod( (x-k) / (1-Conj(k)*x ) ) * rot

seed2 = c( complex(argument=.5,modulus=.7), complex(argument=2.1, modulus=.3), complex(argument=1.7,modulus=.4), complex(argument=-1, modulus=.8))

seed3 = complex(argument=runif(5,min=-pi,max=pi), modulus=runif(5))

Bessel.1 = function(x,a=1) integrate( function(t) cos(a*t - x*sin(t)), 0, pi) / pi
