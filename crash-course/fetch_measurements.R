#############################################################################################
#                                                                                           #
# Fetch air quality measurements from HabitatMap's AirCasting API.                          #          
#                                                                                           #
# AirCasting API documentations:                                                            #
#   https://github.com/HabitatMap/AirCasting/blob/master/doc/api.md                         #
#                                                                                           #
# JSON filter parameter descriptions:                                                       #
#   https://github.com/HabitatMap/AirCasting/blob/master/doc/api.md#parameters-description  #
#                                                                                           #
#############################################################################################

library(rjson)

API_BASE_URL = 'http://aircasting.org'
API_GET_REQUEST_MOBILE_SESSION_STREAM_AND_MEASUREMENTS = '/api/mobile/sessions2/'

# Available session data JSON files to process.
session_locations = list(
  'london' = '201812-london.json',
  'nyc' = '201812-new-york.json',
  'la' = '201812-los-angeles.json',
  'brussels' = '201812-brussels.json'
)

# Select a data file to process
selected_session_json_file = session_locations$brussels

# Build directory path where to save measurement JSON file that will be created.
measurement_data_dir_path = paste("data/api/",
                                  gsub('.json', '', selected_session_json_file),
                                  '/json/',
                                  sep='')

# Create the directory if it does not exist.
print(paste('Creating output directory:', measurement_data_dir_path))
dir.create(measurement_data_dir_path, recursive=TRUE, showWarnings=FALSE)

# Read and loop through JSON file.
sessions_data = fromJSON(file = paste('data/api/', selected_session_json_file, sep=''))

print('Get session data.')
for(session in sessions_data$sessions){

  api_request_url = paste(API_BASE_URL,
                          API_GET_REQUEST_MOBILE_SESSION_STREAM_AND_MEASUREMENTS,
                          session$id,
                          '.json',
                          '?sensor_name=AirBeam2-PM2.5',
                          sep='')
  
  # Grab the measurements for each session.
  print(paste('Fetching data for session ', session$id, '...', sep=''))
  print(api_request_url)
  measurement_data = fromJSON(file = api_request_url)
  
  # Write the fetched data into a file.
  # View the data with a text editor or an online JSON Viewer:
  #   https://jsonformatter.org/json-viewer 
  print(paste('Writing data for session ', session$id, '...', sep=''))
  write(toJSON(measurement_data),
        paste(measurement_data_dir_path, session$id, '.json', sep=''))
  
  # Wait for 1 second before making the next request. Why?
  Sys.sleep(1)
  
  # Alternatively, just as an example on how to dig deeper into the JSON,
  # We could have retrieved the session_id in this way:
  #session_id = session$streams[1]$`AirBeam2-PM2.5`$session_id
}

print('Done.')
