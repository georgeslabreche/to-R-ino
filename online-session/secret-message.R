###############################
# 1. Fetch/Generate the data. #
###############################

# Define the function that will calculate the plot's X values.
calculate_x = function(x){
  16 * sin(x)^3
}

# Define the function that will calculate the plot's Y values.
calculate_y = function(x){
  13 * cos(x) - 5*cos(2*x) - 2*cos(3*x) - cos(4*x)
}

###############################
# 2. Prepare the data.        #
###############################

# Calculate X and Y values. 

# Build the ranges of t values that will serve as 
# input to the calculate_x and calculate_y functions.
# Convert them to radians by multiplying with pi/180.
input_sample = seq(0, 360, len=360) * pi/180

# Calculate our x and y values using the functions we defined.
x = calculate_x(input_sample)
y = calculate_y(input_sample)


#####################
# 3. Plot the data. #
#####################

# Display the secret message in a new window.
dev.new()

# Define our plotting box by drawing an empty plot.
plot(x=0, y=0,
    xlim=c(-20, 20),
    ylim=c(-20, 20),
    type='n',
    axes=FALSE,
    xlab='',
    ylab='')

# Plot the results as a line plot.
lines(x, y, col='red', lty=1, lwd=3)


##################
# 4. Experiment. #
##################

# Things to try:
#   i.  What happens when you change the value of lty and lwd?
#
#   ii. Play with the calculate_x and calculate_y functions.
#       What happens when you change some numbers or remove parts of it?
