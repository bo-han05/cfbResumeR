
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cfbResumeR

<!-- badges: start -->

[![R-CMD-check](https://github.com/bo-han05/cfbResumeR/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/bo-han05/cfbResumeR/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of cfbResumeR is to create a 12-team playoff picture from CFB
team resumes based on-field dominance and record success.

## Installation

You can install the development version of field from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("bo-han05/cfbResumeR")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(cfbResumeR)
season_2026 = data.frame(
  Team = c("Texas", "Michigan State"),
  Conference = c("SEC", "Big Ten"),
  Record = c("12-1-0", "8-4-0"),
  pass_yards_diff_pg = c(120, 110),
  rush_yards_diff_pg = c(180, 160),
  td_diff_pg = c(3, 3),
  interception_diff_pg = c(1, 0),
  fumble_diff_pg = c(0, 1),
  sack_diff_pg = c(2, 1),
  tfl_diff_pg = c(5, 4),
  turnover_diff_pg = c(1, 0),
  possession_diff = c(5, 4),
  penalties_pg = c(4, 3),
  penalty_yards_pg = c(30, 25),
  Ranked_WinPct = c(1, 0.6),
  RegSeason_WinPct = c(12/13, 2/3),
  Conf_WinPct = c(1, 5/9))

playoff_picture(season_2026, n=1)
#>    Team Conference Rank Record
#> 1 Texas        SEC    1 12-1-0
```
