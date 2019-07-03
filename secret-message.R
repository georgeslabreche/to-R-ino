# Define a function that will display the secret message.
plot_secret_message = function(){

  # Display the secret message in a new window.
  dev.new()
  
  # Define our plotting box
  plot(x=c(-20, 20),
       y=c(-20, 20),
       type='n',
       axes=FALSE,
       xlab='',
       ylab='')

  # The range of values.
  t = seq(0, 360, len=360)
  
  # The line functions.
  x = 16 * sin(t*pi/180)^3
  y = 13 * cos(t*pi/180) - 5*cos(2*t*pi/180) - 2*cos(3*t*pi/180) - cos(4*t*pi/180)
  
  # Plot the line functions.
  lines(x, y, col='red', lwd=4)
  lines(-x, y, col='red', lwd=4)
}

plot_secret_message()
