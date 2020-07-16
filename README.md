# Paranormal Distribution - The COVID-19 Rolling Reopening Risk Index

## Short description

### What's the problem?

For this Hackathon we decided to help school administrators in NYC make better informed decisions for when to reopen their schools. Using Design Thinking, we imagined the experience of a school administrator that has to weigh different factors for reopening: whether their school has structural risks that would make it a potential hotspot for the virus, and whether the school is located in an area with high infection rates to begin with. 

### The idea

To accomplish this, we built a model in 2 parts: first, each school in our database is attributed a unique score representing its structural risk: the ethnic makeup of the school, the amount of children that are in poverty, whether it was flagged as being in overcapacity or under capacity etc. All of our data was extracted thanks to NYC’s Open-Data API and was loaded and wrangled in R. Next, we built a dynamic time series model that calculates a day-to-day risk score with historical data with infection and death rates for each Zip-Code in NYC. The data was scraped from GitHub and then loaded in wrangled in Python and then in R. Each day, our model updates the risk score for a given zip code given the new data that comes, and then the day’s COVID-19 Risk Score and the school-specific risk scores are aggregated.

Muna Mwana & Gabriel Gilling
