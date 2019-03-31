# ---- install package
install.packages("gtrendsR")

# ---- google trends query
trends <- gtrendsR::gtrends(
  + keyword = c("αυτοκτονία"),
  + geo = c("GR"),
  + time = "2010-01-01 2016-12-31")

# ---- get interest over time
interest_over_time <- trends$interest_over_time

# ---- save data
readr::write_csv(
  + x = interest_over_time,
  + path = 'interest_over_time.csv')

# ---- download data
httr::GET(url = "http://www.statistics.gr/documents/20181/995819/Deaths+-+Causes+of+death+%28ICD-9%29+%28+2000+-+2016+%29/13fcec78-6b8a-4d04-bca6-e84d2d127887?version=1.0",
          httr::write_disk(path = "causes_of_death.xlsx", overwrite = TRUE))

# ---- import data
year <- 2010
cod <- readxl::read_xlsx(path = "causes_of_death.xlsx",
                         sheet = as.character(year))

# ---- extract relevant data
# select suicides
suicide <- dplyr::filter(cod, stringr::str_detect(cod$...2, "Suicide"))
# select suicides of both genders
suicide <- suicide[1,]
# add to new data frame with year
dataset <- dplyr::tibble(year = year,
          suicides = suicide$`Deaths in Greece during 2010, by age and cause`)

# ---- import data
year <- 2011
cod <- readxl::read_xlsx(path = "causes_of_death.xlsx",
                         sheet = as.character(year))

# ---- extract relevant data
# select suicides
suicide <- dplyr::filter(cod, stringr::str_detect(cod$...2, "Suicide"))
# select suicides of both genders
suicide <- suicide[1,]
# add to new data frame with year
dataset1 <- dplyr::tibble(year = year,
                         suicides = suicide$`Deaths in Greece during 2011, by age and cause`)
# ---- import data
year <- 2012
cod <- readxl::read_xlsx(path = "causes_of_death.xlsx",
                         sheet = as.character(year))

# ---- extract relevant data
# select suicides
suicide <- dplyr::filter(cod, stringr::str_detect(cod$...2, "Suicide"))
# select suicides of both genders
suicide <- suicide[1,]
# add to new data frame with year
dataset2 <- dplyr::tibble(year = year,
                         suicides = suicide$`Deaths in Greece during 2012, by age and cause`)

# ---- import data
year <- 2013
cod <- readxl::read_xlsx(path = "causes_of_death.xlsx",
                         sheet = as.character(year))

# ---- extract relevant data
# select suicides
suicide <- dplyr::filter(cod, stringr::str_detect(cod$...2, "Suicide"))
# select suicides of both genders
suicide <- suicide[1,]
# add to new data frame with year
dataset3 <- dplyr::tibble(year = year,
                         suicides = suicide$`Deaths in Greece during 2013, by age and cause`)

# ---- import data
year <- 2014
cod <- readxl::read_xlsx(path = "causes_of_death.xlsx",
                         sheet = as.character(year))

# ---- extract relevant data
# select suicides
suicide <- dplyr::filter(cod, stringr::str_detect(cod$...2, "Suicide"))
# select suicides of both genders
suicide <- suicide[1,]
# add to new data frame with year
dataset4 <- dplyr::tibble(year = year,
                         suicides = suicide$`Deaths in Greece during 2014, by age and cause`)

# ---- import data
year <- 2015
cod <- readxl::read_xlsx(path = "causes_of_death.xlsx",
                         sheet = as.character(year))

# ---- extract relevant data
# select suicides
suicide <- dplyr::filter(cod, stringr::str_detect(cod$...2, "Suicide"))
# select suicides of both genders
suicide <- suicide[1,]
# add to new data frame with year
dataset5 <- dplyr::tibble(year = year,
                         suicides = suicide$`Deaths in Greece during 2015, by age and cause`)

# ---- import data
year <- 2016
cod <- readxl::read_xlsx(path = "causes_of_death.xlsx",
                         sheet = as.character(year))

# ---- extract relevant data
# select suicides
suicide <- dplyr::filter(cod, stringr::str_detect(cod$...2, "Suicide"))
# select suicides of both genders
suicide <- suicide[1,]
# add to new data frame with year
dataset6 <- dplyr::tibble(year = year,
                         suicides = suicide$`Deaths in Greece during 2016, by age and cause`)

# ----total data
total <- rbind(dataset, dataset1, dataset2, dataset3, dataset4, dataset5, dataset6)