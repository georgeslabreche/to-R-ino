
# Line Chart

measurement_df = read.csv(file='data/api/201812-london/csv/75386.csv')
#measurement_df = read.csv(file='data/api/201812-brussels/csv/75774.csv')


dev.new()
plot(measurement_df[,'latitude'], measurement_df[,'longitude'],
     xlab='Latitude [deg]',
     ylab='Longitude [deg]',
     col='blue')

dev.new()
x = 1:length(measurement_df[,'value'])
plot(x, measurement_df[,'value'],
     type='l',
     xlab='Time [seconds]',
     ylab='PM2.5 [ug/m3]',
     col='green')

#Color coded points.
dev.new()
plot(x, measurement_df[,'value'],
     xlab='Time [seconds]',
     ylab='PM2.5 [ug/m3]',
     pch=3,
     col=ifelse(measurement_df[,'value']>=15,
                'red',
                ifelse(measurement_df[,'value']>=10,
                       'orange',
                       'green')))