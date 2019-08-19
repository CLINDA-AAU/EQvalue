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
#' @param x dataframe
#' @param country country of interest
#' @param name name of the column with "32321"
#' @return Quality Adjusted Life Years that ranges between 1, and slightly negative, meaning worse than dead
#' @export
#' @examples QALY(data.frame(STATE = 23212), country = "dk", name = "STATE")
#' @importFrom dplyr left_join




QALY <- function(x, country = "dk", name = "STATE") {

  if(!is.numeric(x$STATE)) {
    print("Looks like the STATE variable isn't numeric")
  } else {

  load(system.file('extdata', 'values.Rdata', package = 'EQvalue'))

  colnames(EQ5D5L_values)[1]    <- name
  colnames(EQ5D5L_values_5L)[1] <- name

  if (country == "dk") {
    result <- left_join(x, subset(EQ5D5L_values, select = c(name,"Denmark")),                by = name)
  } else if (country == "fr") {
    result <- left_join(x, subset(EQ5D5L_values, select = c(name,"France")),                 by = name)
  } else if (country == "de") {
    result <- left_join(x, subset(EQ5D5L_values, select = c(name,"Germany")),                by = name)
  } else if (country == "jp") {
    result <- left_join(x, subset(EQ5D5L_values, select = c(name,"Japan")),                  by = name)
    result <- left_join(result, subset(EQ5D5L_values_5L, select = c(name,"5_Japan")),        by = name)
  } else if (country == "nl") {
    result <- left_join(x, subset(EQ5D5L_values, select = c(name,"Netherlands")),            by = name)
    result <- left_join(result, subset(EQ5D5L_values_5L, select = c(name,"5_Netherlands")),  by = name)
    result <- left_join(result, subset(EQ5D5L_values_5L, select = c(name,"5_Netherlands2")), by = name)
  } else if (country == "es") {
    result <- left_join(x, subset(EQ5D5L_values, select = c(name,"Spain")),                  by = name)
  } else if (country == "th") {
    result <- left_join(x, subset(EQ5D5L_values, select = c(name,"Thailand")),               by = name)
  } else if (country == "uk") {
    result <- left_join(x, subset(EQ5D5L_values, select = c(name,"UK")),                     by = name)
  } else if (country == "us") {
    result <- left_join(x, subset(EQ5D5L_values, select = c(name,"US")),                     by = name)
    result <- left_join(result, subset(EQ5D5L_values_5L, select = c(name,"5_US")),           by = name)
  } else if (country == "zw") {
    result <- left_join(x, subset(EQ5D5L_values, select = c(name,"Zimbabwe")),               by = name)
  } else {
    result <- "Error"
  }}

  result
}
