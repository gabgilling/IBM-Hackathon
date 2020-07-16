
# log.txt generated from git
log <- read.delim("project_data_asset/log.txt", header = T)
log <- droplevels(log)

dates <- log[grep("Date:", log$LOG),]
log <- log[grep("commit", log$LOG),]

log <- sub("commit ", "", log)
log <- as.data.frame(log)
log$date <- dates

log[3]

# iterate over past commits
cov <- read.csv(paste("https://raw.githubusercontent.com/nychealth/coronavirus-data/",log$log[1],"/data-by-modzcta.csv", sep = ""))
cov$date <- log$date[1]

for (i in 2:nrow(log)){ print(i)
  t <- read.csv(paste("https://raw.githubusercontent.com/nychealth/coronavirus-data/",log$log[i],"/data-by-modzcta.csv", sep = ""))
  t$date <- log$date[i]
  cov <- bind_rows(cov, t)
}

cov$date2 <- gsub("Date:   ", "", cov$date)
cov$date2 <- gsub(" -0400", "", cov$date2)

cov$date2 <- as.Date(cov$date2, format = "%a %b %d %H:%M:%S %Y")

colnames(cov)[1] <- "postcode"

write.csv(cov, "project_data_asset/covid_zip_ts.csv")