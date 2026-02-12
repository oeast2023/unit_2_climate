# East 2026-02-05
# Arctic Sea Ice

# http://nsidc.org/data/G02135
url = "https://noaadata.apps.nsidc.org/NOAA/G02135/north/daily/data/N_seaice_extent_daily_v4.0.csv"

arctic_ice = read.csv(file = url, skip = 2, header = F,
  col.names = c("Year", "Month", "Day", "Extent", "Missing", "Source_data"))

head(arctic_ice)
tail(arctic_ice)
summary(arctic_ice)

# install.packages("lubridate") # only do this once EVER
library(lubridate) # do this evrery R session # make_date()

arctic_ice$date = make_date(year = arctic_ice$Year, month = arctic_ice$Month, day = arctic_ice$Day)
head(arctic_ice)
class(arctic_ice$date)

plot(Extent ~ date, data=arctic_ice, type = "l",
main = "NOAA Arctic sea ice extent",
ylab = "Sea ice extent (*10^6 km^2")

# Calculate the annual average Arctic sea ice extent
# Add/subract 1 to the year b/c only used fully complete years

min(arctic_ice$Year)
max(arctic_ice$Year)
arctic_ice_averages = data.frame(Year = seq(from = min(arctic_ice$Year)+1, to = max(arctic_ice$Year)-1), extent_annual_avg = NA, extent_5yr_average = NA)

# All years that are 1979
arctic_ice$Extent[arctic_ice$Year == 1979]
mean(arctic_ice$Extent[arctic_ice$Year == 1979])
arctic_ice_averages$extent_annual_avg[1] = mean(arctic_ice$Extent[arctic_ice$Year == arctic_ice_averages$Year[1]])

# 47 rows and 3 columns
for(i in seq(dim(arctic_ice_averages)[1])){ arctic_ice_averages$extent_annual_avg[i] = mean(arctic_ice$Extent[arctic_ice$Year == arctic_ice_averages$Year[i]])
  print(paste("i = ", i, "year = ", arctic_ice_averages[i]))
}

head(arctic_ice_averages)
plot(extent_annual_avg ~ Year, data = arctic_ice_averages, type = "l")

# 5 yr average
# -2 b/c don't want to calculate 5 year average for 2024 and 2025
nrow(arctic_ice_averages)
ncol(arctic_ice_averages)
dim(arctic_ice_averages)
i = 3
for (i in seq(3, dim(arctic_ice_averages)[1] - 2)){
  years = seq(from = arctic_ice_averages$Year[i] - 2, to = arctic_ice_averages$Year[i] + 2)
  arctic_ice_averages$extent_5_yr_avg[i] = mean(arctic_ice$Extent[arctic_ice$Year %in% years])
  print(years)
}
head(arctic_ice_averages)
tail(arctic_ice_averages)

plot(extent_5yr_avg ~ Year, data = arctic_ice_averages, type = "l")
lines(extent_annual_avg ~ Year, data = arctic_ice_averages, type = "b", col = "yellowgreen")

arctic_ice_averages$date = make_date(year = arctic_ice_averages$Year)
class(arctic_ice_averages$date)

plot(Extent ~ data = arctic_ice, type = "l")
lines(extent_annual_avg ~ date = arctic_ice_averages, type = "l", col = "red")
lines(extent_5_yr_avg ~ data = arctic_ice_averages, type = "l", col = "blue")