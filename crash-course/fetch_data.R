#############################################################################################
#                                                                                           #
# Visualize air quality data fetched from HabitatMap's AirCasting API.                      #          
#                                                                                           #
# AirCasting API documentations:                                                            #
#   https://github.com/HabitatMap/AirCasting/blob/master/doc/api.md                         #
#                                                                                           #
# JSON filter parameter descriptions:                                                       #
#   https://github.com/HabitatMap/AirCasting/blob/master/doc/api.md#parameters-description  #
#                                                                                           #
#############################################################################################

#########################################
# Load required third-party R packages. #
#########################################

# Data is sent to and received from the AirCasting API using the JSON data format.
#   Load the rjson package in order to work with the JSON data format.
#   Library page: https://cran.r-project.org/web/packages/rjson/
#   Documentation: https://cran.r-project.org/web/packages/rjson/rjson.pdf
library(rjson)


##########################
# Initialize parameters. #
##########################

# The API request URLs, as per the AirCasting API documentation.
API_BASE_URL = 'http://aircasting.org'

API_GET_REQUESTS = list(
  # Return a list of mobile sessions and their streams (without measurements).
  sessions_mobile = '/api/mobile/sessions.json',
  
  # Return a list of fixed active sessions and their streams (without measurements).
  sessions_fixed_active = '/api/fixed/active/sessions.json',
  
  # Returns a mobile session with selected stream and all its measurements.
  mobile_session_stream_and_measurements = '/api/mobile/sessions2/:id',
  
  # Returns measurements for a given stream id.
  measurements = '/api/measurements.json'
)

# Define some bounding boxes for areas of interest.
#   Convenient tool: https://boundingbox.klokantech.com/
#   The "DublinCore" format explicitly states West, South, East, and North bounds.
#
#   Another tool: http://bboxfinder.com/
#

# London.
bounds_london = list(
  west = -0.5074,
  east = 0.2662,
  south = 51.348,
  north = 51.6724
)

# New York City.
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

# Select which bounding box to work with when running this script.
bounds_selected = bounds_NYC

# As per the AirCasting API documentations, the time_from and time_to parameters 
# should be passed as seconds since epoch. They should be expressed in UTC.
#
# How to get a timestamp in seconds since epoch?
#
# 1. Use a function provided by R to convert from a date String to a date:
#     https://www.rdocumentation.org/packages/base/versions/3.6.0/topics/as.POSIX*
#
# 2. Use use another converstion function to get seconds since epoch began:
#     https://stackoverflow.com/a/18464098/4030804
#
time_from = as.integer(as.POSIXct('2018-12-01 00:00:00', tz='UTC'))
time_to = as.integer(as.POSIXct('2018-12-31 23:59:59', tz='UTC'))

############################################
# Fetch data: get list of mobile sessions. #
############################################

filter_parameters = list(
  time_from = time_from,
  time_to = time_to,
  tags = '',
  usernames = '',
  west = bounds_selected$west,
  east = bounds_selected$east,
  south = bounds_selected$south,
  north = bounds_selected$north,
  limit = 100,
  offset = 0,
  sensor_name = 'airbeam2-pm2.5',
  measurement_type = 'Particulate Matter',
  unit_symbol = 'µg/m³')

filter_parameters_json = toJSON(filter_parameters)

# As per API documentation, the filter parms json needs to be URL encoded.
# R provides a function to achieve this:
#   https://www.rdocumentation.org/packages/utils/versions/3.6.0/topics/URLencode
url_encoded_filter_params = URLencode(filter_parameters_json)

# Now stick everything together to build a API GET Request URL.
api_request_url = paste(API_BASE_URL,
                        API_GET_REQUESTS$sessions_mobile,
                        '?q=',
                        url_encoded_filter_params,
                        sep='')

# Grab the results.
data = fromJSON(file = api_request_url)

# Write the fetched data into a file.
# View the data with a text editor or an online JSON Viewer:
#   https://jsonformatter.org/json-viewer 
write(toJSON(data), "data/api/data.json")

