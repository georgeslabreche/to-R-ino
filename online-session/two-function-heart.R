############################################################
# 1. Define how plot to top and bottom parts of the heart. #
############################################################

# Function to plot the top part of the heart.
heart_top = function(x){
  sqrt(1-(abs(x)-1)^2)
}

# Function to plot the bottom part of the heart.
heart_bottom = function(x){
  -3 * sqrt(1-sqrt(abs(x)) / sqrt(2))
}


#######################################
# 2. Calculate X and Y values.        #
# 3. Plot the calculated data points. #
#######################################
dev.new()

# Plot the functions using the curve() functions.
# First the top part.
curve(heart_top(x),
      from=-2, to=2, n=1000,
      xlim=c(-2, 2), ylim=c(-3, 1), # Why are we doing this?
      col='red',
      lty=1,
      lwd=3,
      axes=FALSE,
      xlab='',
      ylab='')

# Then the bottom part.
curve(heart_bottom(x),
      from=-2, to=2, n=1000,
      lty=1,
      lwd=3,
      col='red',
      add=TRUE)

##################
# 4. Experiment. #
##################

# Things to try:
#   i.  Let's distinguish between the top and bottom part.
#       How can we do this?
#
#   ii. How about adding a title?

