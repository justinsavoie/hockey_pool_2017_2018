library(tidyverse)
library(httr)
library(jsonlite)
library(modelr)
library(feather)

source("/Users/justinsavoie/Documents/settings_hockey_pool.R")

get_cumulative_stats <- function(year="2016-2017"){
  url <- paste0("https://api.mysportsfeeds.com/v1.1/pull/nhl/",
                year,
                "-regular/cumulative_player_stats.csv?playerstats=")
  get_csv <- GET(url, auth)
  df <- content(get_csv, type="text/csv")
  df %>% mutate(year=year)
}

df_2017_2018 <- get_cumulative_stats("2017-2018")
Sys.sleep(20)
df_2016_2017 <- get_cumulative_stats("2016-2017")
Sys.sleep(20)
df_2015_2016 <- get_cumulative_stats("2015-2016")
Sys.sleep(20)
df_2014_2015 <- get_cumulative_stats("2014-2015")
Sys.sleep(20)
df_2013_2014 <- get_cumulative_stats("2013-2014")
Sys.sleep(20)
df_2012_2013 <- get_cumulative_stats("2012-2013")
Sys.sleep(20)
df_2011_2012 <- get_cumulative_stats("2011-2012")
Sys.sleep(20)
df_2010_2011 <- get_cumulative_stats("2010-2011")
Sys.sleep(20)
df_2009_2010 <- get_cumulative_stats("2009-2010")

df_binded <- bind_rows(df_2017_2018,
                       df_2016_2017,
                       df_2015_2016,
                       df_2014_2015,
                       df_2013_2014,
                       df_2012_2013,
                       df_2011_2012,
                       df_2010_2011,
                       df_2009_2010)

names(df_binded) <- str_replace_all(names(df_binded),"#","")

write_feather(x = df_binded, path = "data/df_yearly_individual_stats.feather")
