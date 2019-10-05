#' readCSVFile
#' 
#' @description Load the Data and Prepare It for Mapping
#'  If the data is small enough, you can prefer to do everything about the data in the
#' 
#' @param csvFile file to do the data preparation and load our dataset
#' 
#' @return Load the Data and Prepare It for Mapping
#' @export readCSVFile
library(shiny)
library(leaflet)
library(dplyr)
library(tidyr)
library(tidyverse)

readCSVFile <- function(csvFile="./Data/NYPD_7_Major_Felony_Incidents.csv"){
df = read.csv(csvFile, stringsAsFactors = F)


df <- tidyr::separate(data=df, 
                      col=Location.1, 
                      into=c("Latitude", "Longitude"), 
                      sep=",",
                      remove=FALSE)

df$Latitude <- stringr::str_replace_all(df$Latitude, "[(]", "")
df$Longitude <- stringr::str_replace_all(df$Longitude, "[)]", "")


df$Latitude <- as.numeric(df$Latitude)
df$Longitude <- as.numeric(df$Longitude)
saveRDS(df, "./data.rds")


sample_data <- df[c(1:1000),]
saveRDS(sample_data, "./sample_data.rds")
}