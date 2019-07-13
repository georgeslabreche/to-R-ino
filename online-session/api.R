library(rjson)

######################
# 1. Fetch the data. #
######################

token = ""

api_request_url = paste("http://api.waqi.info/feed/bremen/?token=", token, sep="")
georges = fromJSON(file = api_request_url)

api_request_url = paste("http://api.waqi.info/feed/los%20angeles/?token=", token, sep="")
andre = fromJSON(file = api_request_url)

api_request_url = paste("http://api.waqi.info/feed/london/?token=", token, sep="")
diana = fromJSON(file = api_request_url)

api_request_url = paste("http://api.waqi.info/feed/kuching/?token=", token, sep="")
ingrid = fromJSON(file = api_request_url)

api_request_url = paste("http://api.waqi.info/feed/ottawa/?token=", token, sep="")
parents = fromJSON(file = api_request_url)


########################
# 2. Prepare the data. #
########################

aqi_df = data.frame(FamilyMember = c("Georges", "André", "Diana", "Ingrid", "Mom & Dad"),
                    AQI = c(georges$data$aqi, andre$data$aqi, diana$data$aqi, ingrid$data$aqi, parents$data$aqi))


#####################
# 3. Plot the data. #
#####################

dev.new()
barplot(aqi_df$AQI,
        names=aqi_df$FamilyMember,
        col='skyblue',
        ylab = "AQI",
        main = "Labrèche Family AQI Exposure")


####################################
# 4. Experiment: Color coded bars. #
####################################

# Colors in R: http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf
get_air_pollution_level_color_code = function(aqi){
  color = 'green4'
  
  if(aqi >= 300){
    color='darkred'
    
  }else if(aqi >= 201){
    color='darkorchid4'
    
  }else if(aqi >= 151){
    color='red'
    
  }else if(aqi >= 101){
    color='orange'
    
  }else if(aqi >= 51){
    color='yellow'
  }
  
  return(color)
}

bar_colors = c(
  get_air_pollution_level_color_code(georges$data$aqi),
  get_air_pollution_level_color_code(andre$data$aqi),
  get_air_pollution_level_color_code(diana$data$aqi),
  get_air_pollution_level_color_code(ingrid$data$aqi),
  get_air_pollution_level_color_code(parents$data$aqi)
)