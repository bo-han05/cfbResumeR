#### cfbResumeR Package

#' Select College Football Playoff Teams
#'
#' Evaluate each CFB team and return the top n teams for the CFB playoff
#'
#' @param df A df with features: pass_yards_diff_pg, rush_yards_diff_pg, td_diff_pg,
#'        interception_diff_pg, fumble_diff_pg, sack_diff_pg, tfl_diff_pg,
#'        turnover_diff_pg, possession_diff, penalties_pg, penalty_yards_pg,
#'        Ranked_WinPct, Conf_WinPct, RegSeason_WinPct, along with Team, Conference,
#'        and Record
#' @param n Number of teams to select (default 12)
#' @param offenseWeight Weighting of offensive performance for resume score
#' @param defenseWeight Weighting of defensive performance for resume score
#' @param controlWeight Weighting of control performance for resume score
#' @param penaltyWeight Weighting of penalties for resume score
#' @param rankedWeight Weighting of WinPct against ranked opponents for resume score
#' @param confWeight Weighting of WinPct against conference opponents for resume score
#' @param regWeight Weighting of WinPct in the regular season for resume score
#'
#' @return Returns the top n teams based on resume scores
#' @importFrom dplyr arrange mutate select row_number desc coalesce
#' @importFrom magrittr %>%
#' @importFrom utils head
#' @export
playoff_picture = function(df, n=12,
                           offenseWeight=0.10,
                           defenseWeight=0.10,
                           controlWeight=0.05,
                           penaltyWeight=-0.05,
                           rankedWeight=0.50,
                           regWeight=0.15,
                           confWeight=0.05){

  df %>%
    mutate(score =
             offenseWeight*(pass_yards_diff_pg+rush_yards_diff_pg+td_diff_pg) +
             defenseWeight*(interception_diff_pg+fumble_diff_pg+sack_diff_pg+tfl_diff_pg) +
             controlWeight*(turnover_diff_pg+possession_diff) +
             penaltyWeight*(penalties_pg+penalty_yards_pg) +
             rankedWeight*(coalesce(Ranked_WinPct,0)) +
             regWeight*(RegSeason_WinPct) +
             confWeight*(coalesce(Conf_WinPct,0))) %>%
    arrange(desc(score)) %>%
    mutate(Rank=row_number()) %>%
    select(Team, Conference, Rank, Record) %>%
    head(n)
}

