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
#'@param key need a vaild API key from user
#'@export
#'@return A data.frame contains address, latitude and longitude of given location.
#'@examples
#'getAddressInfoByLocation("Mjölby","AIzaSyCbnQWy0geP8Md3nJxfHevjKSx9TK3xI_w")
#'getAddressInfoByLocation("Damascus University","AIzaSyCbnQWy0geP8Md3nJxfHevjKSx9TK3xI_w")

getAddressInfoByLocation <- function(location,key=NULL) {

  stopifnot(is.character(location))

  #prepare location data
  location <- gsub(" ","+", location)

  gitURL <- "https://maps.googleapis.com/maps/api/geocode/json?address="

  responce <- jsonlite::fromJSON(paste0(gitURL, location, paste0("&key=",key)))

  if(responce$status != "OK"){
  #location from input
  #cat("Address:", location,"\n\n")
    info <- NULL
  }else{
    #summary of the info
     lat = responce$results[[3]]$location$lat
     lng = responce$results[[3]]$location$lng
     info <- data.frame(location, lat=NULL, lng=NULL, stringsAsFactors=FALSE)
  }

  return(info)

}
