# Define a function that will display the secret message.
plot_secret_message = function(){
  
  # Display the secret message in a new window.
  dev.new()
  
  # Define our plotting box.
  plot(x=c(-20, 20),
       y=c(-20, 20),
       type='n',
       axes=FALSE,
       xlab='',
       ylab='')
  
  # Define the function that will calculate the plot's X values.
  x_values = function(t){
    16 * sin(t)^3
  }
  
  # Define the function that will calculate the plot's Y values.
  y_values = function(t){
    13 * cos(t) - 5*cos(2*t) - 2*cos(3*t) - cos(4*t)
  }
  
  # Build the ranges of t values that will serve as 
  # input to the x_values and y_values functions.
  # Convert them to radians by multiplying with pi/180.
  t = seq(0, 360, len=360) * pi/180
  
  # Calculate our x and y values using the functions we defined.
  x = x_values(t)
  y = y_values(t)
  
  # Plot the results as a line plot.
  lines(x, y, col='red', lty=1, lwd=3)
  
  # Things to try:
  #   1. What happens when you change the value of lty and lwd?
  #   2. Play with the x_values and y_values functions.
  #       What happens when you change some numbers or remove parts of it?
}

plot_secret_message()
