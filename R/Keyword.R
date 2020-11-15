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
