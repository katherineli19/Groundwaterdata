library(tidyverse)
library(dplyr)

# Load data
groundwater_all <- read_csv('https://data.cnra.ca.gov/dataset/dd9b15f5-6d08-4d8c-bace-37dc761a9c08/resource/bfa9f262-24a1-45bd-8dc8-138bc8107266/download/measurements.csv')

# Show table with groundwater data
View(groundwater_all)

# filter groundwater data by water district site code abd water district with count
# Method No. 1
sites <- aggregate(groundwater_all$SITE_CODE, by=list(groundwater_all$SITE_CODE,groundwater_all$WLM_ORG_NAME), FUN=length)
View(sites)

# Method No. 2
sites_by_district <- sites %>% group_by(Group.2)
View(sites_by_district)


# Medium post on groupby
# https://towardsdatascience.com/grouping-data-with-r-ef95cee48dc6

library(lubridate)

#Extract year from date
format(MSMT_DATE, format = "%Y")

library(lubridate)
groundwater_all$year <- as.numeric(format(groundwater_all$MSMT_DATE,'%Y'))
View(groundwater_all)

groundwater2021 <- subset(groundwater_all,year=="2021")
View(groundwater2021)

write.csv(groundwater2021,"groundwater2021.csv")

groundwater2000 <- subset(groundwater_all,year=="2000")
View(groundwater2000)

write.csv(groundwater2000,"groundwater2000.csv")

groundwater2005 <- subset(groundwater_all,year=="2005")
View(groundwater2005)

write.csv(groundwater2005,"groundwater2005.csv")

groundwater2010 <- subset(groundwater_all,year=="2010")
View(groundwater2010)

write.csv(groundwater2010,"groundwater2010.csv")

groundwater2015 <- subset(groundwater_all,year=="2015")
View(groundwater2015)

write.csv(groundwater2015,"groundwater2015.csv")

