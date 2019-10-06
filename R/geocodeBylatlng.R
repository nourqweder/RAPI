# Google Geocode API
# API Key: &key=AIzaSyCbnQWy0geP8Md3nJxfHevjKSx9TK3xI_w
#
# Standard Usage Limits
# Users of the standard API:
# 2,500 free requests per day, calculated as the sum of client-side and server-side queries.
# 50 requests per second, calculated as the sum of client-side and server-side queries.
#
# https://maps.googleapis.com/maps/api/geocode/json?address=

#'@title geocodeBylatlng
#'@description Returns address of the given latitude and longitude.
#'@param latlng Character class of latitude and longitude separated by ","
#' param key need a vaild API key from user
#'@export
#'@import jsonlite curl
#'@return Character class of the address of the given latitude and longitude.
#'@examples 
#'geocodeBylatlng("37.56654, 126.978", key="AIzaSyCbnQWy0geP8Md3nJxfHevjKSx9TK3xI_w")
#'geocodeBylatlng("37.55723, 127.0453")
geocodeBylatlng <- function(latlng) {
  
  stopifnot(is.character(latlng))
  
  #latitude, longitude transform
  latlng <- gsub(" ","", latlng)
  
  gitURL <- "https://maps.googleapis.com/maps/api/geocode/json?latlng="
  key <- "&key=AIzaSyCbnQWy0geP8Md3nJxfHevjKSx9TK3xI_w"
  responce <- jsonlite::fromJSON(paste0(gitURL, latlng, key))
  
  stopifnot(responce$status == "OK")
  #get lati, long dependenig on google api
  cat("Input latitude and longitude: ", latlng,"\n\n")
  
  #summary of the info
  address <- responce$results[[2]][1]
  
  return(address)
}