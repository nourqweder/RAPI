#' get Infor From User Input
#' @export
#' 
#' @description Loops over the vector of addressInfo and/or coordinates, passes each one of them as a parameter 
#' to an internal function that connects to the \code{Google Geocoding API} via URL and gets the output. Then it 
#' returns the output of the request into a formatted dataframe with the geocoding information.
#' 
#' @param address A character vector with of address/es and/or some coordinates (latitude and longitude)
#' 
#' @return A data.frame containing the resulting \code{longitude/s}, \code{latitude/s} and \code{address/es}
#' 
#' @references 
#' Google Geocoding API - \url{https://developers.google.com/maps/documentation/geocoding/intro}
#' 
#' @examples
#' getInforFromInput(c("Spain", "smålandsvägen 42D, Linghem"))
#' 
#' 
#' 

getInforFromInput <- function(address){
  
  addressInfo <- data.frame(latitude = NULL, longitude = NULL, address = NULL)
  
  for ( i in 1:length(address) ){
    data <- getAddressInfoByLocation(address[i])
    addressInfo <- rbind(addressInfo,data)
  }
  return(addressInfo)
}