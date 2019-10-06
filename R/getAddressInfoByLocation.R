#' getAddress Info By Location
#' 
#' @description Passes the function parameter \code{address} as a parameter to the API via URL.
#' Then it returns the output of the request into a formatted dataframe with the geocoding information.
#' 
#' 
#' @param address A character vector with an address or some coordinates (latitude and longitude)
#' 
#' @return A data.frame containing the resulting \code{longitude}, \code{latitude} and \code{address}
#' 
#' @references 
#' Google Geocoding API - \url{https://developers.google.com/maps/documentation/geocoding/intro}

getAddressInfoByLocation <- function(address){
  
  library(RCurl)
  library(rjson)
  URL <- URLencode(paste("http://maps.google.com/maps/api/geocode/json?address=", address, sep=""))
  data <- fromJSON(getURL(URL))
  if (URL.data$status == "OK"){
    latitude <-data$results[[1]]$geometry$location$lat
    longitude <-data$results[[1]]$geometry$location$lng
    address <-data$results[[1]]$address
  }else{
    latitude <- 0
    longitude <- 0
    address <- "ERROR"
  } 
  Info <- data.frame(latitude = latitude, longitude = longitude, address = address, stringsAsFactors = FALSE)
  
  return(Info)
}