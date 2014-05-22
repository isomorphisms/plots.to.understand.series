#WEGERT STUFF
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
plat = function(domain,FUN, c=35, cex=1.5, pch=46, lightbase=70) {
    plot( domain, col=hcl(
			  h=arg(FUN(domain)),	#main plot
			  l=lightbase+m(domain)
			  ),
	 pch=pch,
	 cex=cex,


	 main=substitute(FUN)	#name plot after function name


	 )
}


source("maths.R")
