df_binded <- read_feather("data/df_yearly_individual_stats.feather")

temp <- df_binded %>%
  select(year, `Player ID`, LastName, FirstName, Points, Age, Position)

dim_1 <- nrow(temp)

temp <- bind_rows(temp,temp,temp,
          temp,temp,temp,
          temp,temp,temp)
temp$year <- rep(sort(unique(df_binded$year)),each=dim_1)

temp %>% gather(key,value,-c(`Player ID`,LastName,FirstName,Age,Position))


left_join((df_2016_2017 %>% select(`#Points`,`#Player ID`)),
          (df_2015_2016 %>% select(`#Points`,`#Player ID`)), by="#Player ID")

#mod_1 <- lm(`2016-2017`~`2015-2016`, data=df_spread)
#rmse(mod_1,df_spread)

#mod_2 <- lm(`2016-2017`~`2015-2016`+`2014-2015`, data=df_spread)
#rmse(mod_2,df_spread)

#mod_3 <- lm(`2016-2017`~`2015-2016`+`2014-2015`+Age, data=df_spread)
#rmse(mod_3,df_spread)

#mod_3 <- lm(`2016-2017`~`2015-2016`+`2014-2015`+Age+Position, data=df_spread)
#rmse(mod_3,df_spread)
