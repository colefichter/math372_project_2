#Plotting the Simple Litter model
t <- seq(0,50,length=50*20)
y <- 600-600*exp(-0.4*t)
plot(t,y,type="l",lwd=2,col="red",xlab="Time (years)",ylab="Grams of C per Square Meter,   x(t)")