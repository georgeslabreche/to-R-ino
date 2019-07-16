library(rjson)

# Option session data files to process.
measurement_data_dir_paths = list(
  'london' = 'data/api/201812-london/json',
  'nyc' = 'data/api/201812-new-york/json',
  'la' = 'data/api/201812-los-angeles/json',
  'brussels' = 'data/api/201812-brussels/json'
)

selected_data_dir_path = measurement_data_dir_paths$london
csv_output_data_dir = gsub('/json', '/csv', selected_data_dir_path)

# Create output directory if it does not exist.
print(paste('Creating output directory:', csv_output_data_dir))
dir.create(csv_output_data_dir, recursive=TRUE, showWarnings=FALSE)

for(measurement_json_file in list.files(selected_data_dir_path, full.names=TRUE)){
  
  # Retrieve the session ide from the file path.
  session_id = gsub(selected_data_dir_path, '', measurement_json_file)
  session_id = gsub('/', '', session_id)
  session_id = gsub('.json', '', session_id)
  
  # Reset data vectors for each session.
  latitudes = c()
  longitudes = c()
  values = c()
  times = c()
  sessions = c()
  
  # Get session data from the session measurement json file.
  sessions_data = fromJSON(file=measurement_json_file)
  
  # Collect the data in vectors.
  print(paste('Reading JSON data file for session ', session_id, '...', sep=''))
  for(measurement in sessions_data$streams$`AirBeam2-PM2.5`$measurements){
    latitudes = c(latitudes, measurement$latitude)
    longitudes = c(longitudes, measurement$longitude)
    values = c(values, measurement$value)
    times = c(times, measurement$time)
    sessions = c(sessions, session_id)
  }
  
  # Create a dataframe object containing the data.
  df = data.frame('latitude' = latitudes,
                  'longitude' = longitudes,
                  'value' = values,
                  'session_id' = sessions)
  
  # Write the data in a CSV file.
  print(paste('Writing CSV data file for session ', session_id, '...', sep=''))
  write.table(df,
              paste(csv_output_data_dir, '/', session_id, '.csv', sep=''),
              sep=',')
}




