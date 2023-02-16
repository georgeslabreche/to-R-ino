# LOAD the leaflet library
library(leaflet)

# Basic example from https://rstudio.github.io/leaflet/
get_basic_map = function(){
  
  m = leaflet() %>%
    addTiles() %>%  # Add default OpenStreetMap map tiles
    addMarkers(lng=174.768, lat=-36.852, popup="The birthplace of R")
  
  return(m)
}

# GeoJSON example taken from https://stackoverflow.com/a/31798996
get_geojson_map = function(){
  url = "https://raw.githubusercontent.com/glynnbird/usstatesgeojson/master/california.geojson"
  geojson = jsonlite::fromJSON(url)
  
  m = leaflet() %>% 
    addTiles() %>%
    setView(lng = -98.583, lat = 39.833, zoom = 4) %>% 
    addGeoJSON(geojson)
  
  return(m)
}


# Custom marker example taken from: https://stackoverflow.com/a/31746476
get_custom_marker_map = function(){
  
  # Create a custom icon
  greenLeafIcon = makeIcon(
    iconUrl = "http://leafletjs.com/examples/custom-icons/leaf-green.png",
    iconWidth = 38, iconHeight = 95,
    iconAnchorX = 22, iconAnchorY = 94,
    shadowUrl = "http://leafletjs.com/examples/custom-icons/leaf-shadow.png",
    shadowWidth = 50, shadowHeight = 64,
    shadowAnchorX = 4, shadowAnchorY = 62
  )
  
  # Draw locations of earthquakes off Fiji
  # Where does the quakes data come from?
  # R comes with some built-in sample datasets: https://www.rdocumentation.org/packages/datasets/versions/3.6.2/topics/quakes
  # What other datasets are available? Enter the data() function in the Console to find out!
  m = leaflet(data = quakes[1:20,]) %>% addTiles() %>%
    addMarkers(~long, ~lat, ~as.character(mag), icon = greenLeafIcon)
  
  return(m)
}

# Get the maps
basic_map = get_basic_map()
geojson_map = get_geojson_map()
custom_marker_map = get_custom_marker_map()

# Display one of the maps
print(basic_map)

# Check out the tutorial:
# https://rstudio.github.io/leaflet/
#
# Try and draw shapes: https://rstudio.github.io/leaflet/shapes.html
# Or put an satellite data on your map: https://rstudio.github.io/leaflet/raster.html
# What else can you do?

# Here are examples of the different tile providers you can use:
# http://leaflet-extras.github.io/leaflet-providers/preview/index.html

# Here is a code sample on how to load tiles from a tile provider using the addProviderTiles function:
# https://r-graph-gallery.com/180-change-background-in-leaflet-map.html

# That website is great in general for visualization examples in R:
# https://r-graph-gallery.com/
