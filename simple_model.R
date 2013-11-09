#Plotting the Simple Litter model
t <- seq(0,50,length=50*20)
y <- 600-600*exp(-0.4*t)
plot(t,y,type="l",lwd=2,bty="n",col="red",xlab="Time (years)",ylab="",main="Grams of Carbon per Square Meter")
text(39,550, labels="x(t)=600-600e^(-0.4t)")