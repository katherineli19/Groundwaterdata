# Groundwaterdata
## A step by step of a data project looking at the decrease in groundwater level in Southern California counties
## Based on interviews, we already know that we're looking at 10 Southern Counties and their groundwater level, and why that will create constraints for the push to build more housing units in that region as prescribed by the Regional Housing Authority: https://scag.ca.gov/sites/main/files/file-attachments/6th-cycle-rhna-final-allocation-plan.pdf?1616462966

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

## Housing Data
1. Visit the US Census website: https://www.census.gov/programs-surveys/popest/technical-documentation/research/evaluation-estimates/2020-evaluation-estimates/2010s-totals-housing-units.html
2. Click "California" and import the housing units 2010~2020 dataset into a Google spreadsheet
3. Name it "Housing Unit 2000~2020"
4. Go to: https://www.census.gov/data/tables/time-series/demo/popest/intercensal-2000-2010-housing-units.html
5. Click "California" and add housing data of 2000~2009 into the "Housing Unit 2000~2020" spreadsheet
6. Freeze header
7. Column V (2020) minus Column B (2000) to find out how much housing units increased between 2 decades
8. Place results in Column W 
9. Column W divided by Column B (2000) to find out the percentage of increase 
10. Place results in Column X
11. Copy both Column W and X and out them in a new spreadsheet, arrange by county
12. Name it "Housing Units Change"
13. Toggle with the "A to Z" arrange function to rank counties by their percentage of increase
14. Highlight the ten Southern counties we're looking at in a different colour for clearer visuals
15. The ten counties are: Imperial, Los Angeles, Kern, Orange, Riverside, San Bernardino, San Diego, San Luis Obispo, Santa Barbara, Ventura

## Analysing groundwater data
1. Use the Query function to extract the ten counties in question from the "groundwater2000" and "groundwater2021" datasets:
2. Example: =QUERY(groundwater2000!A:M,"where M contains 'Los Angeles'")
