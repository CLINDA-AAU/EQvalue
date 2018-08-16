#' Calculates EQ-5D-5L - Quality Adjusted Life Years 
#'
#' This function converts scores from the EQ-5D-5L questionaire to Quality Adjusted Life Years. 
#' The function do this by using value sets of different countries:
#' 
#' Denmark	France	Germany	Japan	Netherlands	Spain	Thailand	UK	US	Zimbabwe
#' 
#' To use it scores of the 5 dimensions need to be pasted together and stored in a dataframe column.
#' eg. 11111 is someone with good health as indicated by answers in the 5 categories and corronsponds
#' to a QALY of 1, except in Zimbabwe, while 53454 would be someone with a bad health and would corronspond 
#' to a low or negative QALY
#' 
#' @param QALY Converts the questionare scores
#' @return Quality Adjusted Life Years that ranges between 1, and slightly negative, meaning worse than dead
#' @export
#' @examples
#' QALY(df, country="dk", name="pasted")




QALY <- function(x, country="dk", name="STATE") {
  
  load(system.file('extdata', 'EQ5D5L_values.Rdata', package = 'EQvalue'))
  
  #load(system.file('extdata', 'EQ5D5L_values_5L.Rdata', package = 'EQvalue'))
  
  #colnames(EQ5D5L_values_5L)[1] <- "X5L.profile"
  
  #values <- plyr::join(EQ5D5L_values, EQ5D5L_values_5L, by="X5L.profile")
  
  values <- EQ5D5L_values
  
  colnames(values)[1] <- name
  
  if (country == "dk") {
    result <- plyr::join(x, subset(values, select=c(name,"Denmark")), by=name)
  } else if (country == "fr") {
    result <- plyr::join(x, subset(values, select=c(name,"France")), by=name)
  } else if (country == "de") {
    result <- plyr::join(x, subset(values, select=c(name,"Germany")), by=name)
  } else if (country == "jp") {
    result <- plyr::join(x, subset(values, select=c(name,"Japan")), by=name)    
  } else if (country == "nl") {
    result <- plyr::join(x, subset(values, select=c(name,"Netherlands")), by=name)
  } else if (country == "es") {
    result <- plyr::join(x, subset(values, select=c(name,"Spain")), by=name)    
  } else if (country == "th") {
    result <- plyr::join(x, subset(values, select=c(name,"Thailand")), by=name)    
  } else if (country == "uk") {
    result <- plyr::join(x, subset(values, select=c(name,"UK")), by=name)    
  } else if (country == "us") {
    result <- plyr::join(x, subset(values, select=c(name,"US")), by=name)
    result <- plyr::join(result, subset(values, select=c(name,"5_US")), by=name) 
    
  } else if (country == "zw") {
    result <- plyr::join(x, subset(values, select=c(name,"Zimbabwe")), by=name)    
  } else {
    result <- "Error"
  }
  
  return(result)
}