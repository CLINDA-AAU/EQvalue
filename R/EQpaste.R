#' The function creates a variable, STATE, that is all the values together and can be used with the QALY function
#'
#' This only works if the data conforms to the standard naming of EQ-5D-5L variables according to the user 
#' guide Which can be found at: https://euroqol.org/wp-content/uploads/2016/09/EQ-5D-5L_UserGuide_2015.pdf
#' 
#' The naming of the data should be: MOBILITY, SELFCARE, ACTIVITY, PAIN, ANXEITY
#' 


EQpaste <- function(x) {

x$STATE <- paste(x$MOBILITY, x$SELFCARE, x$ACTIVITY, x$PAIN, x$ANXIETY, sep="")

  return(x)
}

