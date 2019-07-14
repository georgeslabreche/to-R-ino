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
  'london' = 'data/api/201812-london',
  'nyc' = 'data/api/201812-new-york',
  'la' = 'data/api/201812-los-angeles'
)

bounds_NYC = list(
  west = -74.280611,
  east = -73.727593,
  south = 40.489749,
  north = 40.916852
)

# Create map.
pm_map = getMap(resolution="low")

# Draw the map. Bound it in New York.
plot(pm_map,
     xlim=c(bounds_NYC$west, bounds_NYC$east), # West/East longitude between -180 and 180 degrees.
     ylim=c(bounds_NYC$south, bounds_NYC$north)) # South/North latidude between -90 and 90 degrees.

for(measurement_json_file in list.files(measurement_data_dir_paths$nyc, full.names=TRUE)){
  sessions_data = fromJSON(file=measurement_json_file)
  
  points(sessions_data$streams$`AirBeam2-PM2.5`$measurements$longitude, sessions_data$streams$`AirBeam2-PM2.5`$measurements$latitude,
         col="red", pch=18, cex=0.5)
  
  #for(measurement in sessions_data$streams$`AirBeam2-PM2.5`$measurements){
    # Mark the location of the measurement
    #points(measurement$longitude, measurement$latitude,
    #       col="red", pch=18, cex=0.5)
  #}
}