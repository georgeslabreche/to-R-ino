# Here are two good references on producing maps with rworldmap:
# [1] rworldmap FAQ.
#     https://cran.r-project.org/web/packages/rworldmap/vignettes/rworldmapFAQ.pdf
#
# [2] How to visualize population on map with rworldmap,
#     https://rpubs.com/emmavalme/rworldmap_vignette
#
# [3] Package ‘rworldmap’ (official documentation),
#     https://cran.r-project.org/web/packages/rworldmap/rworldmap.pdf

# LOAD the rworldmap LIBRARY.
library(rworldmap)

# INVOKE the getMap FUNCTION with the resolution ARGUMENT set to "low".
# ASSIGN the map RETURNED by the getMap FUNTION to the my_map VARIABLE.
my_map = getMap(resolution="low")

# ASSIGN the NUMERIC values -75 and 43 to the NY_lon and NY_lat VARIABLES.
# Thees values represent longitude and latitude coordinate location of New York City
NY_lon = -73.9
NY_lat = 40.7

# Create coordinate VARIABLES for Turin.
Turin_lon = 7.7
Turin_lat = 45.1

#' A FUNCTION that will draw a point and label on the map
#'
#' @param lon the longitude coordinate of the point location.
#' @param lat the latitude coordinate of the point location.
#' @param label the label of the point location.
#' @param pos the position of the label
#' 
draw_map_point = function(lon, lat, label, pos){
  
  # INOKE the points function to draw a red point on the map at the geographic
  # location of the given coordinate
  points(lon, lat, pch=18, col="red")
  
  # INVOKE the text function to draw the names of the place next to its points.
  text(lon, lat, label, pos=pos, col="red", cex=1)
}

# Define the map's boundaries.
boundary_padding = 16
boundary_lon = c(NY_lon-boundary_padding, Turin_lon+boundary_padding)
boundary_lat = c(NY_lat-boundary_padding, Turin_lat+boundary_padding)

# INVOKE the plot FUNCTION to draw the map.
# Set the map boundaries with the xlim and ylim FUNCTION ARGUMENTS.
plot(my_map, xlim=boundary_lon, ylim=boundary_lat)

# INVOKE the draw_map_point function to draw location points and labels.
draw_map_point(NY_lon, NY_lat, "New York", 2)
draw_map_point(Turin_lon, Turin_lat, "Turin", 4)

# INVOKE the segments function to draw a line between the two city points.
segments(NY_lon, NY_lat, Turin_lon, Turin_lat, col="red")