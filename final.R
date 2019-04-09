## ---- Google Trends Query
library(gtrendsR)
trends <- gtrendsR::gtrends(
  keyword = c("suicide"),
  geo = c("GR"),
  time = "2010-01-01 2016-12-31")

## ---- Get Interest Over Time 
interest_over_time <- trends$interest_over_time


## ---- Save Data
write.csv(x = interest_over_time,
          file = 'interest_over_time.csv')

# ---- Download Data
httr::GET(url = "http://www.statistics.gr/documents/20181/995819/Deaths+-+Causes+of+death+%28ICD-9%29+%28+2000+-+2016+%29/13fcec78-6b8a-4d04-bca6-e84d2d127887?version=1.0",
          httr::write_disk(path = "causes_of_death.xlsx", overwrite = TRUE))

# ---- Import Data 2010
year <- 2010
cod <- readxl::read_xlsx(path = "causes_of_death.xlsx",
                         sheet = as.character(year))

# ---- Extract Relevant Data 2010
# select suicides 2010
suicide <- dplyr::filter(cod, stringr::str_detect(cod$...2, "Suicide"))
# select suicides of both genders 2010
suicide <- suicide[1,]
# add to new data frame with year 2010
dataset <- dplyr::tibble(year = year,
                         suicides = suicide$`Deaths in Greece during 2010, by age and cause`)

# ---- Import Data 2011
year <- 2011
cod <- readxl::read_xlsx(path = "causes_of_death.xlsx",
                         sheet = as.character(year))

# ---- Extract Relevant Data 2011
# select suicides 2011
suicide <- dplyr::filter(cod, stringr::str_detect(cod$...2, "Suicide"))
# select suicides of both genders 2011
suicide <- suicide[1,]
# add to new data frame with year 2011
dataset1 <- dplyr::tibble(year = year,
                          suicides = suicide$`Deaths in Greece during 2011, by age and cause`)

# ---- Import Data 2012
year <- 2012
cod <- readxl::read_xlsx(path = "causes_of_death.xlsx",
                         sheet = as.character(year))

# ---- Extract Relevant Data 2012
# select suicides 2012
suicide <- dplyr::filter(cod, stringr::str_detect(cod$...2, "Suicide"))
# select suicides of both genders 2012
suicide <- suicide[1,]
# add to new data frame with year 2012
dataset2 <- dplyr::tibble(year = year,
                          suicides = suicide$`Deaths in Greece during 2012, by age and cause`)

# ---- Import Data 2013
year <- 2013
cod <- readxl::read_xlsx(path = "causes_of_death.xlsx",
                         sheet = as.character(year))

# ---- Extract Relevant Data 2013
# select suicides 2013
suicide <- dplyr::filter(cod, stringr::str_detect(cod$...2, "Suicide"))
# select suicides of both genders 2013
suicide <- suicide[1,]
# add to new data frame with year 2013
dataset3 <- dplyr::tibble(year = year,
                          suicides = suicide$`Deaths in Greece during 2013, by age and cause`)

# ---- Import Data 2014
year <- 2014
cod <- readxl::read_xlsx(path = "causes_of_death.xlsx",
                         sheet = as.character(year))

# ---- Extract Relevant Data 2014
# select suicides 2014
suicide <- dplyr::filter(cod, stringr::str_detect(cod$...2, "Suicide"))
# select suicides of both genders 2014
suicide <- suicide[1,]
# add to new data frame with year 2014
dataset4 <- dplyr::tibble(year = year,
                          suicides = suicide$`Deaths in Greece during 2014, by age and cause`)

# ---- Import Data 2015
year <- 2015
cod <- readxl::read_xlsx(path = "causes_of_death.xlsx",
                         sheet = as.character(year))

# ---- Extract Relevant Data 2015
# select suicides 2015
suicide <- dplyr::filter(cod, stringr::str_detect(cod$...2, "Suicide"))
# select suicides of both genders 2015
suicide <- suicide[1,]
# add to new data frame with year 2015
dataset5 <- dplyr::tibble(year = year,
                          suicides = suicide$`Deaths in Greece during 2015, by age and cause`)

# ---- Import Data 2016
year <- 2016
cod <- readxl::read_xlsx(path = "causes_of_death.xlsx",
                         sheet = as.character(year))

# ---- Extract Relevant Data 2016
# select suicides 2016
suicide <- dplyr::filter(cod, stringr::str_detect(cod$...2, "Suicide"))
# select suicides of both genders 2016
suicide <- suicide[1,]
# add to new data frame with year 2016
dataset6 <- dplyr::tibble(year = year,
                          suicides = suicide$`Deaths in Greece during 2016, by age and cause`)

# ---- Total Data
total <- rbind(dataset, dataset1, dataset2, dataset3, dataset4, dataset5, dataset6)

interest <- interest_over_time
interest$Year <- format(interest$date, "%Y")
interest1 <- dplyr::data_frame(hits = interest$hits, Year = interest$Year)

# ---- Convert Hits To Numeric
interest1 <-as.numeric(interest1$hits)

# ---- Aggregate Function
agg = aggregate(interest1,
                by = list(interest$Year),
                FUN = mean)

# ---- Convert Suicides To Numeric
totald <- as.numeric(total$suicides)

# ---- Analysis
group_a <- agg$x
group_b <- totald
df_wide <- data.frame(group_a, group_b)
df_long <- tidyr::gather(
  df_wide, group_a, group_b,
  key = group, value = score)
knitr::kable(df_long)
knitr::kable(df_wide)
cor.test(x = df_wide$group_a, y = df_wide$group_b)

# ---- Plot
library(ggplot2)
ggplot(data = df_wide, aes(x = group_a, y = group_b)) + 
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)
