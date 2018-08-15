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




QALY <- function(x, country, name) {
  
  library(dplyr)
  
  load(system.file('extdata', 'EQ5D5L_values.Rdata', package = 'EQvalue'))
  colnames(EQ5D5L_values)[1] <- name
  
  
  if (country == "dk") {
    result <- join(x, subset(EQ5D5L_values, select=c(name,"Denmark")), by=name)
  } else if (country == "fr") {
    result <- join(x, subset(EQ5D5L_values, select=c(name,"France")), by=name)
  } else if (country == "de") {
    result <- join(x, subset(EQ5D5L_values, select=c(name,"Germany")), by=name)
  } else if (country == "jp") {
    result <- join(x, subset(EQ5D5L_values, select=c(name,"Japan")), by=name)    
  } else if (country == "nl") {
    result <- join(x, subset(EQ5D5L_values, select=c(name,"Netherlands")), by=name)
  } else if (country == "es") {
    result <- join(x, subset(EQ5D5L_values, select=c(name,"Spain")), by=name)    
  } else if (country == "th") {
    result <- join(x, subset(EQ5D5L_values, select=c(name,"Thailand")), by=name)    
  } else if (country == "uk") {
    result <- join(x, subset(EQ5D5L_values, select=c(name,"UK")), by=name)    
  } else if (country == "us") {
    result <- join(x, subset(EQ5D5L_values, select=c(name,"US")), by=name)    
  } else if (country == "zw") {
    result <- join(x, subset(EQ5D5L_values, select=c(name,"Zimbabwe")), by=name)    
  } else {
    result <- "Error"
  }
  
  return(result)
}