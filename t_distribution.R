# dt(x=...., df=...) df= Inf is an option
# gives us the value of probability density p(x) -- height
# comparable to dnorm(x, mean =..., sd =...)

dt(x = 0, df= 20) #gives 0.3939886
#dt(x = 0, df = Inf) = dnorm(0)
# dnorm(0) gives 0.3989423 which means that the normal distribution has a higher peak than the t distribution
# -----------------------------------------------------------
  
# pt(q=x, df=...) gives the cumulative area from -infinity to x
# pt() is for t distribution and is equivalent to pnorm() of normal distribution
pnorm(1.0, mean = 0, sd=1) # gives 0.8413
pt(1.0, df = 8) # gives 0.8267032

# As can be seen above, the normal distribution covers a greater area than the t distribution

# -----------------------------------------------------------
# function qt(x, df=...) is equivalent to qnorm() function
# qt() returns the ordinate for a given area - for a given area under the curve, what is the z-value
  

  