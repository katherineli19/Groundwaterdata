# California's plan to boost housing faces climate constraints
## By Katherine Li

The push to build more affordable housing in California now faces a new challenge: ongoing drought and a declining groundwater supply, especially in Southern counties. 

Towards the end of 2021, the Regional Housing Authority has prescribed a hefty quota for 1,341,827 new housing units to be built across six Southern California counties, respectively Imperial, Los Angeles, Orange, Riverside, San Bernardino, and Ventura. However, due to an ongoing statewide drought and a significant decline in groundwater level over the past two decades, climate scientists express concerns over the idea to build this many housing units in some of the driest regions of California. 

“The State is telling cities that they have to build more housing, but in certain regions there should not be that many houses, because there aren't enough existing resources there to sustain them,” said Deirdre Des Jardins, ​​Director of California Water Research, “These areas are going to be really hot and experience more future droughts, and the State isn’t looking at these constraints when making such plans.”

!['Rainmap'](/Rainmap.png)
!['Housingmap'](/Housingmap.png)

In California, groundwater provides for between 30 to 60 percent of the State’s water needs. Not only is it crucial for California farmers that produce half of the nation’s domestic food supply, groundwater also acts as a buffer against drought induced by climate change. But unlike lakes and reservoirs that can fill up after a year of above-average rain and snow, it could take years, if not decades, for underground water to be replenished. Based on groundwater statistics compiled by the California Natural Resources Agency, there are a total of 766 wells that existed in 2000 which still exist in 2021 across the ten counties of Southern California. Looking at the average groundwater level of each well, 75.85% of those wells have decreased in average water level in 2021 when compared to their average water level in 2000. The drought and the construction of more housing units in desert counties are only going to make matters worse. 

!['BARGRAPH'](/BARGRAPH.png)

Part of the State’s solution is to build more water reservoirs in the North where there are still available water resources. The Sites Reservoir is a proposed 1.8 million foot acre private reservoir set to be built between 2023 and 2030 at the lower Sacramento River. This project has been officially portrayed as a necessary solution to the current drought California is experiencing, which would add 500,000 acre-feet of water to the state’s system annually, and has been on the drawing boards since last century. It is one of the largest and most expensive projects ever to be accepted by the California Water Commission, and in 2018, it received $816 million in funding, while the estimated total funding that this project will eventually need stands at $5.2 billion.

“I think The Sites isn’t an answer because it only increases expectations of a reliable water supply, and increases reliance on exports from the Delta to supply users south of the Delta,” said Jim Brobeck, water analyst from the Aqua Alliance. “Water districts and the water purveyors down South know that taking water out of the Delta and the Sacramento Valley is an unreliable source of water.”

Brobeck explains that while water reservoirs may solve short term water needs, it is essentially further decimating the environment to fix a phenomenon caused by climate change. Not only would The Sites need 8 dams and more pipelines, it could also deplete the Sacramento River by diverting water during low flow years, as well as allow harmful minerals and algae to build up in the reservoir water due to increasing temperatures, ultimately making that water unusable. 

“The salts, the heavy metals, the toxic algae blooms and water temperature problems, those are all water quality issues that have separate remediation processes. There's no way to treat the water in a way that is economically or environmentally feasible,” said Brobeck.

Indeed, based on analysis done by the Natural Resources Defense Council, water from Sites is already likely to cost more than $700 per acre foot on average, an estimate which does not include the additional costs to move water through the Delta or down the California Aqueduct and other canals, and the potential cost for water treatment. 

Citing data from the Metropolitan Water District Service area which has doubled in population since the 1970s, their total amount of water use has remained steady despite the increase in population, which to Brobeck signifies that municipalities do have the skills to increase water efficiency. He believes that more housing could be built under the condition that counties change their flood control system to recharge their aquifers, encourage people to take out their European style grass lawns and replace them with drought resistant native vegetation, and encourage the replacement of old in-house appliances with more efficient models.

“We have to acknowledge the reality of a shrinking pool of resources and adapt,” said Brobeck, “Whether it’s solving the housing crisis or the water crisis, neither should involve rash and rushed decisions, or we will face more serious future reprecussions.” 




# Groundwaterdata Markdown
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
17. !['Housingincrease'](/Housingincrease.png)
18. https://datawrapper.dwcdn.net/mSC4M/1/
19. !['Housingmap'](/Housingmap.png)

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
!['LAexample'](/LAexample.png)
26. Use the Sum function to check the total for both Column C and D, to check that the 8 wells that have shown increase did not outweigh the decline
27. Repeat Steps 4 to 25 for the remaining 9 Southern counties
28. !['Countyresults'](/Countyresults.png)
29. !['BARGRAPH'](/BARGRAPH.png)

## Precipitation 
1. Go to https://www.ncdc.noaa.gov/cag/county/mapping/4/pcp/202112/12/value
2. Find values by county in 2021
3. Copy the County and Value columns into a spreadsheet
4. Sort by A to Z for County
5. Clean up the County column so only the name remains, for example, "Kern County CA" needs to be rewritten as "Kern" for Datawrapper to recognise it
6. https://datawrapper.dwcdn.net/yJCag/1/
7. !['Rainmap'](/Rainmap.png)

## Summary of finding 
Based on groundwater statistics compiled by the California Natural Resources Agency, there are a total of 766 wells that existed in 2000 which still exist in 2021 across the ten counties of Southern California. Looking at the average groundwater level of each well, 75.85% of those wells have decreased in average water level in 2021 when compared to their average water level in 2000. The ones experiencing the most serious decline being Kern and Ventura. We can also see that precipitation is significantly lower for Southern counties, while most housing developments over the past 20 years have being concentrated in the Central and Southern areas of California. It is therefore meaningful to explore how to build new housing units in better regions or how build them to function more efficiently, because the existing amount of natural resources is shrinking more rapidly in specific regions.

## Read the Story
https://docs.google.com/document/d/1Ohb2RxZNFKvPLeFBGh4Z3IXIQ3wz2L5BNvdTvGL4r3Q/edit?usp=sharing
