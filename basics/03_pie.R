# More examples here: https://www.statmethods.net/graphs/pie.html

# The size of each pie slice.
slices = c(10, 12, 4, 16, 8)

# The label for each slice.
labels = c("US", "UK", "Australia", "Germany", "France")

# Invoke the PIE function to draw the pie chart.
# Precede with dev.new() to draw the plot in a new window. 
dev.new()
pie(slices, labels=labels, main="Pie Chart of Countries")