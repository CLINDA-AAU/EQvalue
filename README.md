
<!-- README.md is generated from README.Rmd. Please edit that file -->
EQvalue
=======

Overview
--------

EQvalue is an R package to calculate Quality Adjusted Life Year's (QALY) from [EuroQol questionaire EQ-5D-5L](https://euroqol.org/eq-5d-instruments/eq-5d-5l-about/)

Installation
------------

``` r
# The easiest way to install:
devtools::install_github("HaemAalborg/EQvalue")
```

Usage
-----

The function is called `QALY` and takes as arguments a dataframe, a country and a name of the colum with the parsed scores eg. 11111.

``` r
library(EQvalue)
library(plyr)

score <- c(11111,23242,53212)
name <- c("Hansen","Jensen","Olesen")
df <- data.frame(score,name)

QALY(df, country="dk", name="score")
#>   score   name Denmark
#> 1 11111 Hansen   1.000
#> 2 23242 Jensen   0.492
#> 3 53212 Olesen   0.320
```
