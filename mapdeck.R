library(mapdeck)

viewer = getOption("viewer")

# Prep for authentication to Mapbox
key = ""
set_token(key)

######################
# 1. Fetch the data. #
######################

crash_data = read.csv("https://git.io/geocompr-mapdeck")


########################
# 2. Prepare the data. #
########################

crash_data = na.omit(crash_data)


#####################
# 3. Plot the data. #
#####################

ms = mapdeck_style("dark")

mapdeck(style = ms, pitch = 45, location = c(0, 52), zoom = 4) %>%
  add_grid(data = crash_data, lat = "lat", lon = "lng", cell_size = 1000,
           elevation_scale = 50, layer_id = "grid_layer",
           colour_range = viridisLite::plasma(6))
