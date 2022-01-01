# Rscript install_packages.R

install.packages(c("knitr","rmarkdown", "leaflet","googlesheets","maps","ggvis","tidyverse","shinydashboard",
	"highcharter","htmltools","DT","googleVis","flexdashboard"),repos = "https://cloud.r-project.org", dep=TRUE)
