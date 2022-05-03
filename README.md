# Groundwaterdata
A step by step of a data project looking at the decrease in groundwater level in Southern California counties

## RStudio
1. Run code: 
library(tidyverse)
library(dplyr)
2. Download Dataset from California Natural Resources Agency:
#Load data
groundwater_all <- read_csv('https://data.cnra.ca.gov/dataset/dd9b15f5-6d08-4d8c-bace-37dc761a9c08/resource/bfa9f262-24a1-45bd-8dc8-138bc8107266/download/measurements.csv')
3. Display dataset in RStudio with below code:
#Show table with groundwater data
View(groundwater_all)
4. Since the goal is to filter out how different is year 2021 compared to 2000, these two years needs to be extracted 
5. First we need to extract the year from the date and put it in a separate column:
#Extract year from date
format(MSMT_DATE, format = "%Y")
library(lubridate)
groundwater_all$year <- as.numeric(format(groundwater_all$MSMT_DATE,'%Y'))
View(groundwater_all)
6. Extract all rows of year 2021:
groundwater2021 <- subset(groundwater_all,year=="2021")
View(groundwater2021)
7. Export that into a csv file:
write.csv(groundwater2021,"groundwater2021.csv")
8. Repeate step 6 and 7 for year 2000:
groundwater2000 <- subset(groundwater_all,year=="2000")
View(groundwater2000)
write.csv(groundwater2000,"groundwater2000.csv")
9. Import above files into Google Sheets for further analysis
