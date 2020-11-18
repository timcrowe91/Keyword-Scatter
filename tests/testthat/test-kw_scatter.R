test_that("kw_scatter tests", {

  expect_error(kw_scatter(data = gapminder::gapminder, keyword = "Dem.", keyword_column = country, x = lifeExp, y = gdpPercap, xtrim = 10))

  expect_equal(kw_scatter(data = gapminder::gapminder, keyword = "United", keyword_column = country, x = lifeExp, y = gdpPercap),
               gapminder::gapminder %>%
                 dplyr::filter(grepl("United", country)) %>%
                 tidyr::drop_na(lifeExp) %>%
                 tidyr::drop_na(gdpPercap) %>%
                 ggplot2::ggplot(ggplot2::aes(x = lifeExp, y = gdpPercap)) +
                 ggplot2::geom_point() +
                 ggplot2::theme_bw())

})
