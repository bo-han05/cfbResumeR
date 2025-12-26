
<!-- README.md is generated from README.Rmd. Please edit that file -->

# cfbResumeR

<!-- badges: start -->

[![R-CMD-check](https://github.com/bo-han05/cfbResumeR/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/bo-han05/cfbResumeR/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of cfbResumeR is to create a playoff picture from CFB team
resumes based on-field dominance and record success, with configurable
team counts and resume score weights.

## Installation

You can install the development version of cfbResumeR from
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
  Team = c("Texas", "Michigan State", "Georgia", "Ohio State", "Oregon", "Alabama",
           "Penn State", "Florida State", "USC", "Notre Dame"),
  Conference = c("SEC", "Big Ten", "SEC", "Big Ten", "Big Ten", "SEC", "Big Ten",
                 "ACC", "Big Ten", "FBS Independents"),
  Record = c("12-1-0", "9-4-0", "11-2-0", "11-2-0", "8-4-0", "9-3-0", "9-3-0",
             "10-3-0", "6-6-0", "7-5-0"),
  pass_yards_diff_pg = c(120, 90, 105, 130, 80, 90, 75, 85, 50, 80),
  rush_yards_diff_pg = c(180, 120, 170, 150, 100, 165, 155, 145, 100, 135),
  td_diff_pg = c(3, 1, 2.5, 2.5, 1, 1.5, 1.5, 2, 0.5, 1.5),
  interception_diff_pg = c(0.5, 0, 1, -0.5, 0, 1, 0, -1, -0.5, 0),
  fumble_diff_pg = c(0.5, 0, 0.5, 0, 0, 0, -0.5, -0.5, 0, 1),
  sack_diff_pg = c(1, 0.5, 2, 1, 0, 1.5, 1, -1, -2, 0.5),
  tfl_diff_pg = c(2, 2.5, 3, 2, 1, 1.5, 1.5, 2, 0, 1),
  turnover_diff_pg = c(1, 0, 1.5, 2, 0, 1, 1, 0, -1, 1.5),
  possession_diff = c(4000, 2000, 2500, 5500, 1500, 1000, 500, 1500, -1500, 500),
  penalties_pg = c(4, 3, 5, 4, 6, 5, 4, 6, 7, 4),
  penalty_yards_pg = c(40, 25, 45, 35, 60, 45, 35, 65, 70, 35),
  Ranked_WinPct = c(4/5, 2/4, 3/4, 3/4, 2/4, 2/4, 3/4, 2/4, 0/3, 1/4),
  RegSeason_WinPct = c(12/13, 9/13, 11/13, 11/13, 8/12, 9/12, 9/12, 10/13, 6/12,
                       7/12),
  Conf_WinPct = c(1, 6/9, 7/9, 7/9, 7/9, 6/8, 7/9, 6/8, 5/9, NA)
)

playoff_picture(season_2026, n=4)
#>             Team Conference Rank Record
#> 1     Ohio State    Big Ten    1 11-2-0
#> 2          Texas        SEC    2 12-1-0
#> 3        Georgia        SEC    3 11-2-0
#> 4 Michigan State    Big Ten    4  9-4-0
```
