#Plotting the Simple Litter model
t <- seq(0,50,length=50*20)
y <- 400*exp(0.6*t) - 400
plot(t,y,type="l",lwd=2,col="red",ylab="x(t)")