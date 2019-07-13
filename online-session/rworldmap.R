library(rworldmap)
# Doc: https://cran.r-project.org/web/packages/rworldmap/rworldmap.pdf

######################
# 1. Fetch the data. #
######################

# Dowload the data from CSV into a R data frame object
airports_df = read.csv("https://raw.githubusercontent.com/jpatokal/openflights/master/data/airports.dat",
                       header=FALSE)


########################
# 2. Prepare the data. #
########################

# Create column names for the dataset.
colnames(airports_df) = c("ID", "name", "city", "country", "IATA_FAA", "ICAO", "lat", "lon", "altitude", "timezone", "DST")


#####################
# 3. Plot the data. #
#####################

# Open new window for this plot.
dev.new()

# Create map.
airport_map = getMap(resolution = "low")

# Draw the map. Bound it in Europe.
plot(airport_map,
     xlim=c(-20, 59), # West/East longitude between -180 and 180 degrees.
     ylim=c(35, 71)) # South/North latidude between -90 and 90 degrees.

# Mark the location of airports.
points(airports_df$lon, airports_df$lat,
       col="red", pch=18, cex=0.5)


#################################################
# 4a. Experiment: Show airports in France only. #
#################################################

# Apply a filter to the original airports data frame.
# Get the row numbers of all data frame rows that contain data on airports in France.
filtered_row_numbers = which(airports_df$country == "France")

# Create a new data frame that only contains data on French airports.
airports_france_df = airports_df[filtered_row_numbers,]

# Open new window for this plot.
dev.new()

# Create map.
airport_map_france = getMap(resolution = "low")

# Draw the map centered in France.
plot(airport_map_france,
     xlim=c(0, 10), # West/East
     ylim=c(40, 60)) # South/North

# Mark the location of airports.
points(airports_france_df$lon, airports_france_df$lat,
       col="red", pch=18, cex=0.5)


#############################################################
# 4b. Experiment: Flight path from BRE->CDG->JFK->MEX->LAX. #
#############################################################

# Grab row data on airports of interest.
trip = airports_df[airports_df$IATA_FAA %in% c("BRE", "CDG", "JFK", "MEX", "LAX"),]

# Sort them based on their longitude so that the travel path makes sense
# in terms of traveling from one city to another (i.e. next city is the narest city.)
trip = trip[order(trip$lon),]

# Open new window for this plot.
dev.new()

# Create map.
flight_path_map = getMap(resolution = "low")

# Draw the map centered in the Atlantic. 
plot(flight_path_map,
     xlim=c(-130, 20), # West/East
     ylim=c(40, 60)) # South/North

# Draw points for each airport locations.
points(trip$lon, trip$lat,
       col="red", pch=18, cex=1.2)

# Put names of cities next to the airport points.
text(x=trip$lon, y=trip$lat, labels=trip$city,
     col="red", pos=4, cex=0.8)

# Draw flight path between airports.
lines(x=trip$lon,
      y=trip$lat,
      col='red', lty=2)