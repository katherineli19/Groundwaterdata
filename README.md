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
5. Click "California" and add housing data of 2000 to 2009 into the "Housing Unit 2000~2020" spreadsheet
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
16. Clean up the County column so that only the County name remains alone
17. https://datawrapper.dwcdn.net/mSC4M/1/
18. !['Housingmap'](/Housingmap.png)

## Comparing groundwater data: 2000 Vs. 2021
1. Use the Query function to extract the ten counties in question from the "groundwater2000" and "groundwater2021" datasets:
2. Example: =QUERY(groundwater2000!A:M,"where M contains 'Los Angeles'")
3. Create a separate spreadsheet for each county, title it "(County name) Average" for clarity
4. Using Los Angeles as an example:
5. Since the number of sites being tested have varied greatly throughout the years and location really matters, only the same well can be compared to its own average measurements across the years
6. Use Vlookup to find out which LA wells from 2000 are still pumping in 2021: =Vlookup(A2, 'Los Angeles 2000'!A:C, 3, False)
7. Column A contains the sitecode which is unique to each well, Column C contains the measurement in feet
8. Remove rows in Los Angeles 2021 that don't have a match, signifying that the well wasn't there in 2000
9. Find the annual average for each well that was there for both 2000 and 2020
10. For example: =average(C3:C10)
11. The above step needs to be repeated for both Los Angeles 2021 and Los Angeles 2000
12. Open up the Los Angeles Average spreadsheet
13. Paste in the average results obtained from Los Angeles 2000
14. Use Vlookup again to match Los Angeles 2021 average results to the Los Angeles 2000 average results
15. For example: =Vlookup(A2, 'Los Angeles 2021'!A:D, 4, False)
16. Place sitecodes in Column A, county name in B, year 2000 in C, year 2021 in D
17. Column C minus Column D would show us whether the groundwater level at that particular site has increased or decreased, put that in Column E
18. A positive number in Column E would signify a decrease in groundwater level, whereas a negative number would signify an increase
19. Use "A to Z" arrangement tool on Column E to rank the sites 
20. Fill the positive number rows with red, the negative number columns with green, for clarity
21. Create Column F, and do E/C to find percent change 
22. Format Column F so that it appears as a percentage with two decimals
23. Count how many sites in LA decreased and figure out a percentage
24. For example, among the total of 34 LA well sites that are functional between 2000 and 2021, 26 of them have shown decline in groundwater level, therefore around 76.47% of these wells have shown decline
25. Use the Sum function to check the total for both Column C and D, to check that the 8 wells that have shown increase did not outweigh the decline
26. Repeat Steps 4 to 25 for the remaining 9 Southern counties
27. !['Countyresults'](/Countyresults.png)

## Precipitation 
1. Go to https://www.ncdc.noaa.gov/cag/county/mapping/4/pcp/202112/12/value
2. Find values by county in 2021
3. Copy the County and Value columns into a spreadsheet
4. Sort by A to Z for County
5. Clean up the County column so only the name remains, for example, "Kern County CA" needs to be rewritten as "Kern" for Datawrapper to recognise it
6. https://datawrapper.dwcdn.net/yJCag/1/
7. !['Rainmap'](/Rainmap.png)
