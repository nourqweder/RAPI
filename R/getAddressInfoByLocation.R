# Google Geocode API
# API Key: &key=AIzaSyCbnQWy0geP8Md3nJxfHevjKSx9TK3xI_w
#
# Standard Usage Limits
# Users of the standard API:
# 2,500 free requests per day, calculated as the sum of client-side and server-side queries.
# 50 requests per second, calculated as the sum of client-side and server-side queries.
#
# https://maps.googleapis.com/maps/api/geocode/json?address=

#'@title getAddressInfoByLocation
#'@description Returns latitude and longitude of the given input location.
#'@param location Character class of location address
#'@export
#'@import jsonlite curl
#'@return A data.frame contains address, latitude and longitude of given location.
#'@examples 
#'getAddressInfoByLocation("Mjölby")
#'getAddressInfoByLocation("Damascus University")

getAddressInfoByLocation <- function(location,key) {
  
  stopifnot(is.character(location))
  
  #prepare location data
  location <- gsub(" ","+", location)
  
  gitURL <- "https://maps.googleapis.com/maps/api/geocode/json?location="
  
  responce <- jsonlite::fromJSON(paste0(gitURL, location, key))
  
  stopifnot(responce$status == "OK")
  #location from input
  cat("Address:", location,"\n\n")
  
  #summary of the info
  lat = responce$results[[3]]$location$lat
  lng = responce$results[[3]]$location$lng
  
  info <- data.frame(location, lat, lng, stringsAsFactors=FALSE)
  
  return(info)
  
}