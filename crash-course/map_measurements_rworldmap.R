#############################################################################################
#                                                                                           #
# Map air quality measurements retrieved from HabitatMap's AirCasting API.                  #          
#                                                                                           #                                                                                     #
#############################################################################################

library(rjson)
library(rworldmap)

# Open new window for this plot.
dev.new()

# Option session data files to process.
measurement_data_dir_paths = list(
  'london' = 'data/api/201812-london/json',
  'nyc' = 'data/api/201812-new-york/json',
  'la' = 'data/api/201812-los-angeles/json',
  'brussels' = 'data/api/201812-brussels/json'
)

# London.
bounds_london = list(
  west = -0.5074,
  east = 0.2662,
  south = 51.348,
  north = 51.6724
)

# New York.
bounds_NYC = list(
  west = -74.280611,
  east = -73.727593,
  south = 40.489749,
  north = 40.916852
)

# Los Angeles.
bounds_LA = list(
  west = -118.6255,
  east = -117.0125,
  south = 33.5924,
  north = 34.3373
)

# Brussels.
bounds_brussels = list(
  west = 4.245833,
  east = 4.485531,
  south = 50.767636,
  north = 50.915013
)

# Select target datasets.
selected_data_dir_path = measurement_data_dir_paths$brussels
selected_bounds = bounds_brussels

# Create map.
pm_map = getMap(resolution="low")

# Draw the map.
plot(pm_map,
     xlim=c(selected_bounds$west, selected_bounds$east), # West/East longitude between -180 and 180 degrees.
     ylim=c(selected_bounds$south, selected_bounds$north)) # South/North latidude between -90 and 90 degrees.

for(measurement_json_file in list.files(selected_data_dir_path, full.names=TRUE)){
  print(measurement_json_file)
  sessions_data = fromJSON(file=measurement_json_file)
  
  for(measurement in sessions_data$streams$`AirBeam2-PM2.5`$measurements){
    color = 'green'
    
    if(measurement$value >= 10){
      color = 'red'
    }else if(measurement$value >= 5){
      color = 'orange'
    }
      
    # Draw points.
    points(measurement$longitude,
           measurement$latitude,
           col=color,
           pch=18,
           cex=0.5)
  }
}

