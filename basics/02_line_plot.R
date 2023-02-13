# Create a VECTOR of NUMERIC values as SEQUENCE from 0 to 10 at increments of 1.
# This sequence will contain 11 numeric values for our plot's x-axis.
vect_x = seq(0, 10, 1)

# Create a VECTOR of 11 NUMERIC values for our plot's y-axis.
vect_y = c(9, 5, 10, 2, 4, 9, 7, 3, 6, 8, 7)

# INVOKE the plot FUNCTION to draw a plot.
# Plot a line chart using the x and y NUMERIC VETORS as the point coordinates.
plot(x=vect_x, y=vect_y,
     ylim=c(0, 10),
     type="l", col="red",
     xlab="X Axis", ylab="Y Axis",
     main="My Line Plot")

# Create a VECTOR of 11 NUMERIC values for our plot's second line.
# These values represent y-axis coordinates and will simply be the reversed
# values of the vect_y VECTOR minus 1.
vect_y2 = rev(vect_y) - 1

# INVOKE the lines FUNCTION to add a line to the plot.
lines(x=vect_x, y=vect_y2, col="blue", lty=2)

# Draw a legend.
legend("bottomright", title="My Legend",
       legend=c("Line 1", "Line 2"),
       col=c("red", "blue"), lty=c(1,2))