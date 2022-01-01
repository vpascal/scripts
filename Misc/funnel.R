library(highcharter)
library(dplyr)

thm <- hc_theme(colors = c('red', 'green', 'red'))


highchart() %>% 
  hc_chart(type = "funnel") %>% 
  hc_add_series(
    name = "Unique Users",
    data = list_parse(
      data.frame(
        name = c("Applications", "Admitted", "Enrolled"),
        y = c(1157, 886, 313))))