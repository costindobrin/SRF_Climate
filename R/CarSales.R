# Read in the data
#
library(tidyverse)
library(readxl)
df1 <- read_excel("data/Transportation/10301_hev_sales.xlsx", skip = 2)%>% 
  select(-X__1) %>% 
  filter(!is.na(Total)) %>% 
  filter(Vehicle!="TOTAL")
  (Year=`Annual Total`, Fossil=`Total Fossil Fuels Production`, Renewable=`Total Renewable Energy Production`, Total = `Total Primary Energy Production`) %>% 
  gather(key = Type, value = BTU, -Year) %>% 
  mutate(BTU = as.numeric(BTU))
tidyplot1 <- gather(df1, key = year, value = sales,-Vehicle)


df2 <- read_excel("data/Energy/Table_1.1_Primary_Energy_Overview.xlsx", sheet=2, skip=9) %>% 
  filter(!is.na(`Annual Total`))
dfplot <- df2 %>% select
ggplot(dfplot, aes(x = Year, y = BTU, group = Type, color = Type)) +geom_line()

df3 <- df2 %>% 
  select()