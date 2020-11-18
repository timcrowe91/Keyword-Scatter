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
#' @param ... Further arguments to be used inside the geom_point() function of the plot (eg colour = "Red")
#'
#' @return
#'
#' A ggplot geom_point() graph
#'
#' @export
#'
#' @examples
#'
#' kw_scatter(data = gapminder::gapminder, keyword = "United", keyword_column = country, x = lifeExp, y = gdpPercap)
#'
kw_scatter <- function(data, keyword, keyword_column, x, y, xlogscale = FALSE, ylogscale = FALSE, xtrim = 0, ytrim = 0, na.rm = TRUE, ...){

  if(!dplyr::between(xtrim, 0, 1)) stop("Please choose an xtrim value between 0 and 1")
  if(!dplyr::between(ytrim, 0, 1)) stop("Please choose an ytrim value between 0 and 1")

  data %>%
    dplyr::filter(grepl(keyword, {{ keyword_column }})) %>%
    {if (na.rm) tidyr::drop_na(., {{ x }}) else .} %>%
    {if (na.rm) tidyr::drop_na(., {{ y }}) else .} %>%
    {if (xtrim) dplyr::filter(., dplyr::between({{ x }}, stats::quantile({{ x }}, xtrim / 2), stats::quantile({{ x }}, 1 - xtrim / 2))) else .} %>%
    {if (ytrim) dplyr::filter(., dplyr::between({{ y }}, stats::quantile({{ y }}, ytrim / 2), stats::quantile({{ y }}, 1 - ytrim / 2))) else .} %>%
    ggplot2::ggplot(ggplot2::aes({{ x }}, {{ y }})) +
    ggplot2::geom_point(...) +
    {if (xlogscale == TRUE) ggplot2::scale_x_log10()} +
    {if (ylogscale == TRUE) ggplot2::scale_y_log10()} +
    ggplot2::theme_bw()

}
