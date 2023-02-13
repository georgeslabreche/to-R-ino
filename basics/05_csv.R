library("jpeg")

# the url
url = "https://data.kingcounty.gov/api/views/yaai-7frk/rows.csv?accessType=DOWNLOAD"

# the dataframe
df = read.csv(url)


# how many rows
print(ncol(df))

# How many columns?
print(nrow(df))


# the column names
print(colnames(df))

# print all values from the "Image" column
# print(df[, "Image"])

# get random image
ran_row_index = sample(1:nrow(df), 1)
img_url = df[ran_row_index, "Image"]

# download a random image
#download.file(img_url, 'cutie.jpg', mode = 'wb')

# read the image
#img = readJPEG("cutie.jpg",native=TRUE)

# show the image
#plot(0:1,0:1,type="n",ann=FALSE,axes=FALSE)
#rasterImage(img,0,0,1,1)


# AGGRESSIVE
print(unique(df[,"Temperament"]))
df_agg = df[df$Temperament == "AGGRESSIVE",]
ran_row_index = sample(1:nrow(df_agg), 1)
img_url = df[ran_row_index, "Image"]

# download a random image
download.file(img_url, 'cutie.jpg', mode = 'wb')

print(ran_row_index)
print(img_url)

# read the image
img = readJPEG("cutie.jpg",native=TRUE)


# show the image
plot(0:1,0:1,type="n",ann=FALSE,axes=FALSE)
rasterImage(img,0,0,1,1)

