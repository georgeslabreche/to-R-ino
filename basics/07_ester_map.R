# Load the library
#install.packages("leaflet")
library(leaflet)

#get the data
LUCAS = read.csv("LUCAS-SOIL-2018.csv")
point_id = LUCAS$POINTID
lat = LUCAS$TH_LAT
lon = LUCAS$TH_LONG
land_use = LUCAS$LC0_Desc
cover_type = LUCAS$LC1_Desc
lucas_land_use = data.frame(point_id, lat, lon, land_use, cover_type)
lucas_forest = lucas_land_use[lucas_land_use$land_use == "Woodland",]


# The vector that will contain all our marker colors
marker_colors = c()

# Populate the vector with the maker colors
for(cover_type in lucas_forest$cover_type){
  if(cover_type == "Other coniferous woodland") {
    marker_colors = c(marker_colors, "green")
  } else if(cover_type == "Spruce dominated coniferous woodland") {
    marker_colors = c(marker_colors, "yellow")
  } else if(cover_type == "Other mixed woodland") {
    marker_colors = c(marker_colors, "brown")
  } else if(cover_type == "Pine dominated coniferous woodland") {
    marker_colors = c(marker_colors, "darkgreen")
  } else if(cover_type == "Broadleaved woodland") {
    marker_colors = c(marker_colors, "lightgreen")
  } else if(cover_type == "Spruce dominated mixed woodland") {
    marker_colors = c(marker_colors, "orange")
  } else {
    marker_colors = c(marker_colors, "pink")
  }
}

# Create the icons using AwesomeIcons
icons = awesomeIcons(
  icon = 'ios-close',
  iconColor = 'black',
  library = 'ion',
  markerColor = marker_colors
)

# Create the map
m = leaflet(data = lucas_forest) %>% addTiles() %>% 
  setView( lng = 2.34, lat = 48.85, zoom = 3 ) %>% 
  addProviderTiles("Esri.WorldImagery")  %>% 
  addAwesomeMarkers(~lon, ~lat, 
             icon = icons,
             popup = ~as.character(cover_type), 
             label = ~as.character(cover_type))

# Show the map
print(m)




