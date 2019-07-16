#############################################################################################
#                                                                                           #
# Map air quality measurements retrieved from HabitatMap's AirCasting API.                  #          
#                                                                                           #                                                                                     #
#############################################################################################

library(rjson)
library(leaflet)

emoji_happy = "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/samsung/161/smiling-face-with-smiling-eyes_1f60a.png"
emoji_anxious = "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/samsung/161/face-with-open-mouth-and-cold-sweat_1f630.png"
emoji_sick = "https://emojipedia-us.s3.dualstack.us-west-1.amazonaws.com/thumbs/240/samsung/161/nauseated-face_1f922.png" 

# Build data frame.
measurement_df = read.csv(file='data/api/201812-new-york/csv/74912.csv')
#measurement_df = read.csv(file='data/api/201812-london/csv/75386.csv')

# https://rstudio.github.io/leaflet/markers.html
# https://emojipedia.org
emojiMarker = icons(
  iconUrl = ifelse(measurement_df$value >= 15,
                   emoji_sick,
                   ifelse(measurement_df$value >= 10,
                          emoji_anxious,
                          emoji_happy)),
  iconWidth=15, iconHeight=15,
  iconAnchorX=0, iconAnchorY=0
)

map = leaflet(measurement_df) %>%
  # https://leaflet-extras.github.io/leaflet-providers/preview/
  #addProviderTiles("Stamen.Watercolor") %>%
  #addProviderTiles("Stamen.TonerHybrid") %>%
  #addProviderTiles("OpenTopoMap") %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  
  addMarkers(lng=~longitude,
             lat=~latitude,
             popup=~value,
             icon=emojiMarker) %>% 

print(map)


