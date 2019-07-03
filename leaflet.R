library(leaflet)
# Docs: https://cran.r-project.org/web/packages/leaflet/leaflet.pdf

######################
# 1. Fetch the data. #
######################

us_capitals_df = read.csv("https://raw.githubusercontent.com/jasperdebie/VisInfo/master/us-state-capitals.csv")


########################
# 2. Prepare the data. #
########################

filtered_row_numbers = which(us_capitals_df$description %in% c('Augusta', 'Concord', 'Boston', 'Hartord', 'Montpelier', 'Albany'))
filtered_rows = us_capitals_df[filtered_row_numbers,]


#####################
# 3. Plot the data. #
#####################

map = leaflet(us_capitals_df) %>%
  addTiles() %>%  # Add default OpenStreetMap map tiles
  
  addMarkers(lng=~longitude,
             lat=~latitude,
             popup=~description) %>% 
  
  addPolylines(lng=filtered_rows[,'longitude'],
               lat=filtered_rows[,'latitude'],
               col='red')

print(map)

  
