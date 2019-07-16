library(rjson)

#
measurement_json_filename = '95576.json'
csv_measurement_filename  = '95576.csv'

# Reset data vectors for each session.
latitudes = c()
longitudes = c()
values = c()
times = c()

# Get session data from the session measurement json file.
sessions_data = fromJSON(file=measurement_json_filename)

# Collect the data in vectors.
for(measurement in sessions_data$streams$`AirBeam2-PM2.5`$measurements){
  latitudes = c(latitudes, measurement$latitude)
  longitudes = c(longitudes, measurement$longitude)
  values = c(values, measurement$value)
  times = c(times, measurement$time)
}

# Create a dataframe object containing the data.
df = data.frame('latitude' = latitudes,
                'longitude' = longitudes,
                'value' = values)

# Write the data in a CSV file.
write.table(df,
            csv_measurement_filename,
            sep=',')