kw_test <- gapminder %>%
  filter(grepl("United", country)) %>%
  drop_na(lifeExp) %>%
  drop_na(gdpPercap) %>%
  ggplot(aes(x = lifeExp, y = gdpPercap)) +
  geom_point() +
  theme_bw()


test_that("kw_scatter tests", {

  expect_error(kw_scatter(data = gapminder, keyword = "Dem.", keyword_column = country, x = lifeExp, y = gdpPercap, xtrim = 10))

  expect_error(kw_scatter(vancouver_trees, "JAPANESE", common_name, date_planted, diameter, xtrim = 0.01))

  expect_equal(kw_scatter(data = gapminder, keyword = "United", keyword_column = country, x = lifeExp, y = gdpPercap),
  kw_test)

})
