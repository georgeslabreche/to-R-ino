# LOAD the LIBRARY needed to read jpeg image files
library("jpeg")

# the URL of the CSV file
url = "https://data.kingcounty.gov/api/views/yaai-7frk/rows.csv?accessType=DOWNLOAD"

# the dataframe
df = read.csv(url)

# apply a filter so that we only keep dog data
df = df[df$animal_type == "Dog" , ]

# how many rows?
print(ncol(df))

# how many columns?
print(nrow(df))

# get random dog image url
ran_row_index = sample(1:nrow(df), 1)
img_url = df[ran_row_index, "Image"]

# download the random dog image
download.file(img_url, 'puppy.jpg', mode = 'wb')

# read the image
img = readJPEG("puppy.jpg",native=TRUE)

# prepare the plotting area
plot(0:1,0:1, type="n")

# draw a line
lines(x=c(0, 0.2, 0.6, 1),
     y=c(0, 0.6, 0.6, 1),
     col="blue")

# INVOKE the rasterImage() FUNCTION to display the image on the plot
rasterImage(img, 0.4, 0, 0.8, 0.4)

# Draw some points to show the image boundaries used in rasterImage()
points(0.4, 0, pch=4, cex=3, col="red")
points(0.8, 0.4, pch=4, cex=3, col="red")
