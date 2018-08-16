
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

EQ-5D-5L data looks something like this

    #>     NAME MOBILITY SELFCARE ACTIVITY PAIN ANXIETY
    #> 1 Hansen        1        1        1    1       1
    #> 2 Jensen        2        3        2    3       2
    #> 3 Olesen        2        5        4    3       1

The function `EQpaste` gathers the answers into one column if they corronspond to the naming scheeme proposed in the user guide, which is: MOBILITY, SELFCARE, ACTIVITY, PAIN, ANXIETY.

``` r
library(EQvalue)

df_1 <- EQpaste(df_0)
df_1
#>     NAME MOBILITY SELFCARE ACTIVITY PAIN ANXIETY STATE
#> 1 Hansen        1        1        1    1       1 11111
#> 2 Jensen        2        3        2    3       2 23232
#> 3 Olesen        2        5        4    3       1 25431
```

The function is called `QALY` and takes as arguments a dataframe, a country and a name of the colum with the parsed scores eg. 11111.

``` r
df_2 <- QALY(df_1, country="dk", name="STATE")
df_2
#>     NAME MOBILITY SELFCARE ACTIVITY PAIN ANXIETY STATE Denmark
#> 1 Hansen        1        1        1    1       1 11111   1.000
#> 2 Jensen        2        3        2    3       2 23232   0.625
#> 3 Olesen        2        5        4    3       1 25431   0.509
```
