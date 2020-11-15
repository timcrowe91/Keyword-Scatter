#' Plot a keyword-filtered scatter graph
#'
#' @param data The tibble on which the function is being performed.
#' @param keyword The string that the keyword_column will be filtered for.
#' @param keyword_column The column that will be filtered to only include entries that contain the keyword. Input should be a character / factor column.
#' @param x The column to use for the x-axis of the plot. Input should be a column that can be used for a scatter graph (eg numeric, datetime).
#' @param y The column to use for the y-axis of the plot. Input should be a column that can be used for a scatter graph (eg numeric, datetime).
#' @param xlogscale Option to use a log-scale on the x-axis.
#' @param ylogscale Option to use a log-scale on the y-axis.
#' @param xtrim Option to trim a certain proportion of the x-axis data (split across either end of the value range). Value should be between 0 and 1.
#' @param ytrim Option to trim a certain proportion of the y-axis data (split across either end of the value range). Value should be between 0 and 1
#' @param na.rm Choice of keeping or removing NA values.
#' @param ... Further arguments.
#'
#' @return
#'
#' A ggplot geom_point() graph
#'
#' @export
#'
#' @examples
#'
#' kw_scatter(data = gapminder, keyword = "United", keyword_column = country, x = lifeExp, y = gdpPercap)
#'
kw_scatter <- function(data, keyword, keyword_column, x, y, xlogscale = FALSE, ylogscale = FALSE,                             xtrim = 0, ytrim = 0, na.rm = TRUE, ...){

  if(!between(xtrim, 0, 1)) stop("Please choose an xtrim value between 0 and 1")
  if(!between(ytrim, 0, 1)) stop("Please choose an ytrim value between 0 and 1")

  data %>%
    filter(grepl(keyword, {{ keyword_column }})) %>%
    {if (na.rm) drop_na(., {{ x }}) else .} %>%
    {if (na.rm) drop_na(., {{ y }}) else .} %>%
    {if (xtrim) filter(., between({{ x }}, quantile({{ x }}, xtrim / 2), quantile({{ x }}, 1 - xtrim / 2))) else .} %>%
    {if (ytrim) filter(., between({{ y }}, quantile({{ y }}, ytrim / 2), quantile({{ y }}, 1 - ytrim / 2))) else .} %>%
    ggplot(aes({{ x }}, {{ y }})) +
    geom_point() +
    {if (xlogscale == TRUE) scale_x_log10()} +
    {if (ylogscale == TRUE) scale_y_log10()} +
    theme_bw()

}
