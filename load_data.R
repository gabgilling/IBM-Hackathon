library(RSocrata)
library(dplyr)
library(tidyr)
library(ggplot2)
library(readr)

### USE SOCRATA API TO GET PUBLICLY AVAILABLE NYC DATA FROM DOE

# population per zip code
zip.pop <- read.socrata("https://data.cityofnewyork.us/resource/pri4-ifjk.json")

# high school meta-data
# https://data.cityofnewyork.us/Education/2020-DOE-High-School-Directory/23z9-6uk9
hs.meta <- read.socrata("https://data.cityofnewyork.us/resource/23z9-6uk9.json")
print(length(unique(hs.meta$dbn)))

# middle school meta-data
# https://data.cityofnewyork.us/Education/2020-DOE-Middle-School-Directory/fdpt-nzk4
ms.meta <- read.socrata("https://data.cityofnewyork.us/resource/fdpt-nzk4.json")
print(length(unique(ms.meta$schooldbn)))

# demographic snapshot of every school in NYC
# https://data.cityofnewyork.us/Education/2018-2019-School-Demographic-Snapshot/45j8-f6um
demographic.snapshot <- read.socrata("https://data.cityofnewyork.us/resource/45j8-f6um.json")
print(length(unique(demographic.snapshot$dbn)))

# pre school meta-data
# https://data.cityofnewyork.us/Education/2018-Pre-K-School-Directory/xck4-5xd5
pk.meta <- read.socrata("https://data.cityofnewyork.us/resource/xck4-5xd5.json")


## UNDER AND OVERCAPACITY DATA FROM DOE
### PERCENTAGES NOT ENOUGH SIMPLER TO USE BINARY FOR MVP
undercapacity <- read_csv("undercapacity.csv")
colnames(undercapacity)[7] <- "dbn"
undercapacity$undercap_p <- undercapacity$`Building Enrollment (2016-2017 Blue Book)`/undercapacity$`Building Capacity (2016-2017 Blue Book)`
undercapacity$undercap <- 1


overcapacity <- read_csv("overcapacity.csv")
overcapacity <- overcapacity %>%  na.omit
overcapacity$`School Code` <- paste("01", overcapacity$`School Code`, sep ="")
colnames(overcapacity)[3] <- "dbn"
colnames(overcapacity)[8] <- "overcap_p"
overcapacity$overcap <- 1

