test_that("kw_scatter tests", {

  # First test: verify that the function gives an error when using a xtrim value outside of 0 and 1
  expect_error(kw_scatter(data = gapminder::gapminder, keyword = "Dem.", keyword_column = country, x = lifeExp, y = gdpPercap, xtrim = 10))

  # Second test: as above, with ytrim
  expect_error(kw_scatter(data = gapminder::gapminder, keyword = "Dem.", keyword_column = country, x = lifeExp, y = gdpPercap, ytrim = 10))

  # Third test: Comparing an example of the function, with the same ggplot being created from scratch
  expect_equal(kw_scatter(data = gapminder::gapminder, keyword = "United", keyword_column = country, x = lifeExp, y = gdpPercap, colour = "Blue"),
               gapminder::gapminder %>%
                 dplyr::filter(grepl("United", country)) %>%
                 tidyr::drop_na(lifeExp) %>%
                 tidyr::drop_na(gdpPercap) %>%
                 ggplot2::ggplot(ggplot2::aes(x = lifeExp, y = gdpPercap)) +
                 ggplot2::geom_point(colour = "Blue") +
                 ggplot2::theme_bw())

})
