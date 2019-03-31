# ---- install package
install.packages("gtrendsR")

# ---- google trends query
trends <- gtrendsR::gtrends(
  + keyword = c("aooieoii??a"),
  + geo = c("GR"),
  + time = "2010-01-01 2016-12-31")

# ---- get interest over time
interest_over_time <- trends$interest_over_time

# ---- save data
readr::write_csv(
  + x = interest_over_time,
  + path = 'interest_over_time.csv')

trends <- gtrendsR::gtrends(
  + keyword = c("αυτοκτονία"),
  + geo = c("GR"),
  + time = "2010-01-01 2010-12-31")
interest_over_time <- trends$interest_over_time
readr::write_csv(
  + x = interest_over_time,
  + path = 'interest_over_time.csv')
trends <- gtrendsR::gtrends(
  + keyword = c("αυτοκτονία"),
  + geo = c("GR"),
  + time = "2011-01-01 2011-12-31")
interest_over_time1 <- trends$interest_over_time
trends <- gtrendsR::gtrends(
  + keyword = c("αυτοκτονία"),
  + geo = c("GR"),
  + time = "2012-01-01 2012-12-31")
interest_over_time2 <- trends$interest_over_time
trends <- gtrendsR::gtrends(
  + keyword = c("αυτοκτονία"),
  + geo = c("GR"),
  + time = "2013-01-01 2013-12-31")
interest_over_time3 <- trends$interest_over_time
trends <- gtrendsR::gtrends(
    + keyword = c("αυτοκτονία"),
    + geo = c("GR"),
    + time = "2014-01-01 2014-12-31")
interest_over_time4 <- trends$interest_over_time
trends <- gtrendsR::gtrends(
    + keyword = c("αυτοκτονία"),
    + geo = c("GR"),
    + time = "2015-01-01 2015-12-31")
interest_over_time5 <- trends$interest_over_time
trends <- gtrendsR::gtrends(
    + keyword = c("αυτοκτονία"),
    + geo = c("GR"),
    + time = "2016-01-01 2016-12-31")
interest_over_time6 <- trends$interest_over_time

df = subset(interest_over_time, select = -c(date,keyword,geo,gprop,category) )
df1 = subset(interest_over_time1, select = -c(date,keyword,geo,gprop,category) )
df2 = subset(interest_over_time2, select = -c(date,keyword,geo,gprop,category) )
df3 = subset(interest_over_time3, select = -c(date,keyword,geo,gprop,category) )
df4 = subset(interest_over_time4, select = -c(date,keyword,geo,gprop,category) )
df5 = subset(interest_over_time5, select = -c(date,keyword,geo,gprop,category) )
df6 = subset(interest_over_time6, select = -c(date,keyword,geo,gprop,category) )
  
colSums(df)
colMeans(df)
colSums(df1)
colMeans(df1)
colSums(df2)
colMeans(df2)
colSums(df3)
colMeans(df3)
colSums(df4)
colMeans(df4)
colSums(df5)
colMeans(df5)
colSums(df6)
colMeans(df6)

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
