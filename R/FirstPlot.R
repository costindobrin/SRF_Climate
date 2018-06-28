# Read in the data
#
library(tidyverse)
df1 <- read_csv("data/monthly_in_situ_co2_mlo.csv", skip = 56, na = "-99.99")

colnames(df1) <- c("Yr", "Mn", "Date1", "Year", "CO2", "C6", "C7", "C8", "C9", "C10")

ggplot(df1, aes(x = Year, y = CO2)) + geom_smooth(color="red") + geom_line(color="blue") + geom_point(size=0.1)

#Data 2


df2 <- read_csv("data/observed.csv")
df2 <- df2 %>%
  mutate(sign = ifelse(Annual_Mean<0, "negative", "positive"))
ggplot(df2, aes(x = Year, y = Annual_Mean, fill = sign)) + geom_col() + scale_fill_manual(values=c("blue", "red"))

dfnegative <- df2 %>%
  select(Annual_Mean) %>%
  filter(Annual_Mean<0)


#Data 3
df3 <- read_csv("data/global_co2.csv")
ggplot(df3, aes(x=year, y=data_mean_global)) + geom_line()
df3 <- df3 %>%
  rename(Year = year)

datajoin <- full_join(df2, df3, by = "Year")

