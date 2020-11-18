
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Keyword.Scatter

<!-- badges: start -->

<!-- badges: end -->

Keyword.Scatter is a package created for assigment 2 of my STAT-545B
course. The package contains the function `kw_scatter()`, which creates
a ggplot scatter graph from a tibble that has been filtered by the
chosen keyword contained in a chosen column.

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
install.packages("devtools")
devtools::install_github("timcrowe91/Keyword.Scatter")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(Keyword.Scatter)
library(gapminder)
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union

1 + 1
#> [1] 2
# TEST WITH "..." ----- alpha transparency etc... put it in the geom_point() ?
#kw_scatter(data = gapminder, keyword = "United", keyword_column = country, x = lifeExp, y = gdpPercap)
```

## Step By Step Process To Create Package

1.  create\_package() to start the “Keyword.Scatter” package
2.  use\_git() to convert it to a git repository
3.  In terminal:
      - “git remote add origin
        <https://github.com/timcrowe91/Keyword.Scatter>” to connect my
        local repo to GitHub
      - “git push -u origin master” to push everything to my GitHub repo
4.  use\_r(“Keyword”) to create the script to put my function in
5.  use\_readme\_rmd() to create README file
6.  build\_readme() to render README (ongoing)
7.  Manually edited DESCRIPTION file in R-Studio to input title, author,
    description
8.  use\_mit\_license(“Tim Crowe”)
9.  Used Roxygen to create documentation and rendered using document()
10. use\_testthat() to create files for tests
11. use\_test(“kw\_scatter”) to create test script for function, and
    filled with tests from assigment 1b
