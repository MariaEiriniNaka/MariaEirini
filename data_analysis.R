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

# ---- google trends query1
trends <- gtrendsR::gtrends(
  + keyword = c("αυτοκτονία"),
  + geo = c("GR"),
  + time = "2011-01-01 2011-12-31")

# ---- get interest over time1
interest_over_time1 <- trends$interest_over_time

# ---- google trends query2
trends <- gtrendsR::gtrends(
  + keyword = c("αυτοκτονία"),
  + geo = c("GR"),
  + time = "2012-01-01 2012-12-31")

# ---- get interest over time2
interest_over_time2 <- trends$interest_over_time

# ---- google trends query3
trends <- gtrendsR::gtrends(
  + keyword = c("αυτοκτονία"),
  + geo = c("GR"),
  + time = "2013-01-01 2013-12-31")

# ---- get interest over time3
interest_over_time3 <- trends$interest_over_time

# ---- google trends query4
trends <- gtrendsR::gtrends(
    + keyword = c("αυτοκτονία"),
    + geo = c("GR"),
    + time = "2014-01-01 2014-12-31")

# ---- get interest over time4
interest_over_time4 <- trends$interest_over_time

# ---- google trends query5
trends <- gtrendsR::gtrends(
    + keyword = c("αυτοκτονία"),
    + geo = c("GR"),
    + time = "2015-01-01 2015-12-31")

# ---- get interest over time5
interest_over_time5 <- trends$interest_over_time

# ---- google trends query6
trends <- gtrendsR::gtrends(
    + keyword = c("αυτοκτονία"),
    + geo = c("GR"),
    + time = "2016-01-01 2016-12-31")

# ---- get interest over time6
interest_over_time6 <- trends$interest_over_time

# ---- df
df = subset(interest_over_time, select = -c(date,keyword,geo,gprop,category) )

# ---- df1
df1 = subset(interest_over_time1, select = -c(date,keyword,geo,gprop,category) )

# ---- df2
df2 = subset(interest_over_time2, select = -c(date,keyword,geo,gprop,category) )

# ---- df3
df3 = subset(interest_over_time3, select = -c(date,keyword,geo,gprop,category) )

# ---- df4
df4 = subset(interest_over_time4, select = -c(date,keyword,geo,gprop,category) )

# ---- df5
df5 = subset(interest_over_time5, select = -c(date,keyword,geo,gprop,category) )

# ---- df6
df6 = subset(interest_over_time6, select = -c(date,keyword,geo,gprop,category) )

# ---- sumdf
colSums(df)

# ---- meandf
colMeans(df)

# ---- sumdf1
colSums(df1)

# ---- meandf1
colMeans(df1)

# ---- sumdf2
colSums(df2)

# ---- meandf2
colMeans(df2)

# ---- sumdf3
colSums(df3)

# ---- meandf3
colMeans(df3)

# ---- sumdf4
colSums(df4)

# ---- meandf4
colMeans(df4)

# ---- sumdf5
colSums(df5)

# ---- meandf5
colMeans(df5)

# ---- sumdf6
colSums(df6)

# ---- meandf6
colMeans(df6)

# ---- download data
httr::GET(url = "http://www.statistics.gr/documents/20181/995819/Deaths+-+Causes+of+death+%28ICD-9%29+%28+2000+-+2016+%29/13fcec78-6b8a-4d04-bca6-e84d2d127887?version=1.0",
          httr::write_disk(path = "causes_of_death.xlsx", overwrite = TRUE))

# ---- import data 2010
year <- 2010
cod <- readxl::read_xlsx(path = "causes_of_death.xlsx",
                         sheet = as.character(year))

# ---- extract relevant data 2010
# select suicides 2010
suicide <- dplyr::filter(cod, stringr::str_detect(cod$...2, "Suicide"))
# select suicides of both genders 2010
suicide <- suicide[1,]
# add to new data frame with year 2010
dataset <- dplyr::tibble(year = year,
                         suicides = suicide$`Deaths in Greece during 2010, by age and cause`)

# ---- import data 2011
year <- 2011
cod <- readxl::read_xlsx(path = "causes_of_death.xlsx",
                         sheet = as.character(year))

# ---- extract relevant data 2011
# select suicides 2011
suicide <- dplyr::filter(cod, stringr::str_detect(cod$...2, "Suicide"))
# select suicides of both genders 2011
suicide <- suicide[1,]
# add to new data frame with year 2011
dataset1 <- dplyr::tibble(year = year,
                          suicides = suicide$`Deaths in Greece during 2011, by age and cause`)
# ---- import data 2012
year <- 2012
cod <- readxl::read_xlsx(path = "causes_of_death.xlsx",
                         sheet = as.character(year))

# ---- extract relevant data 2012
# select suicides 2012
suicide <- dplyr::filter(cod, stringr::str_detect(cod$...2, "Suicide"))
# select suicides of both genders 2012
suicide <- suicide[1,]
# add to new data frame with year 2012
dataset2 <- dplyr::tibble(year = year,
                          suicides = suicide$`Deaths in Greece during 2012, by age and cause`)

# ---- import data 2013
year <- 2013
cod <- readxl::read_xlsx(path = "causes_of_death.xlsx",
                         sheet = as.character(year))

# ---- extract relevant data 2013
# select suicides 2013
suicide <- dplyr::filter(cod, stringr::str_detect(cod$...2, "Suicide"))
# select suicides of both genders 2013
suicide <- suicide[1,]
# add to new data frame with year 2013
dataset3 <- dplyr::tibble(year = year,
                          suicides = suicide$`Deaths in Greece during 2013, by age and cause`)

# ---- import data 2014
year <- 2014
cod <- readxl::read_xlsx(path = "causes_of_death.xlsx",
                         sheet = as.character(year))

# ---- extract relevant data 2014
# select suicides 2014
suicide <- dplyr::filter(cod, stringr::str_detect(cod$...2, "Suicide"))
# select suicides of both genders 2014
suicide <- suicide[1,]
# add to new data frame with year 2014
dataset4 <- dplyr::tibble(year = year,
                          suicides = suicide$`Deaths in Greece during 2014, by age and cause`)

# ---- import data 2015
year <- 2015
cod <- readxl::read_xlsx(path = "causes_of_death.xlsx",
                         sheet = as.character(year))

# ---- extract relevant data 2015
# select suicides 2015
suicide <- dplyr::filter(cod, stringr::str_detect(cod$...2, "Suicide"))
# select suicides of both genders 2015
suicide <- suicide[1,]
# add to new data frame with year 2015
dataset5 <- dplyr::tibble(year = year,
                          suicides = suicide$`Deaths in Greece during 2015, by age and cause`)

# ---- import data 2016
year <- 2016
cod <- readxl::read_xlsx(path = "causes_of_death.xlsx",
                         sheet = as.character(year))

# ---- extract relevant data 2016
# select suicides 2016
suicide <- dplyr::filter(cod, stringr::str_detect(cod$...2, "Suicide"))
# select suicides of both genders 2016
suicide <- suicide[1,]
# add to new data frame with year 2016
dataset6 <- dplyr::tibble(year = year,
                          suicides = suicide$`Deaths in Greece during 2016, by age and cause`)

# ----total data 
total <- rbind(dataset, dataset1, dataset2, dataset3, dataset4, dataset5, dataset6)
