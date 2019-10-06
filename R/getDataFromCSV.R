#' Google Geocoding API connector for CSV files
#' @export
#' 
#' @description Takes a csv file path (with the required columns \code{location1} and/or \code{Latitude} and
#'  \code{Longitude}) as a parameter and creates a vector with the information that will be passed to the 
#' \code{getInforFromInput} function that will connect with the Google Geocoding API and get the corresponding output.
#' 
#' @param filePath A csv file path
#' 
#' @return A data.frame containing the resulting \code{longitude/s}, \code{latitude/s} and \code{location1/es}
#' 
#' @references 
#' Google Geocoding API - \url{https://developers.google.com/maps/documentation/geocoding/intro}
#' 
#' @examples
#' #getDataFromCSV(filePath)
#'
#' 

getDataFromCSV <- function(filePath){
  data <- read.csv(filePath, sep = ";")
  
  searchResult <- NULL
  locationData <- any(tolower(names(data)) == "location")
  latiData <- any(tolower(names(data)) == "latitude")
  longData <- any(tolower(names(data)) == "longitude")
  
  if (locationData){
    position <- which(tolower(names(data)) == "location1")
    searchResult <- gsub("^\\s+|\\s+$", "", data[, position])
    if (!all(searchResult != "")){
      if ((latiData) & (longData)){
        latiIndex <- which(tolower(names(data)) == "latitude")
        longIndex <- which(tolower(names(data)) == "longitude")
        site <- which(searchResult == "")
        naData <- which(complete.cases(data[site, c(latiIndex, longIndex)]))
        site <- site[naData]
        searchResult[site] <- 
          paste(data[, latiIndex][site], data[, longIndex][site], sep = ", ")
      }
    }
  }else{
    if ((latiData) & (longData)){
      latiIndex <- which(tolower(names(data)) == "latitude")
      longIndex <- which(tolower(names(data)) == "longitude")
      site <- which(complete.cases(data[, c(latiIndex, longIndex)]))
      searchResult[site] <- 
        paste(data[, latiIndex][site], data[, longIndex][site], sep = ", ")
      site.na <- which(!complete.cases(data[, c(latiIndex, longIndex)]))
      searchResult[site.na] <- ""
    }
  }
  return(getInforFromInput(searchResult))
}