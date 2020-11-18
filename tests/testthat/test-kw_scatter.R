kw_test <- steam_games %>%
  filter(grepl("Action", genre)) %>%
  drop_na(original_price) %>%
  drop_na(achievements) %>%
  ggplot(aes(x = original_price, y = achievements)) +
  geom_point() +
  theme_bw()

test_that("kw_scatter tests", {

  expect_error(kw_scatter(data = gapminder, keyword = "Dem.", keyword_column = country, x = lifeExp, y = gdpPercap, xtrim = 10))

  expect_error(kw_scatter(vancouver_trees, "JAPANESE", common_name, date_planted, diameter, xtrim = 0.01))

  expect_equal(kw_scatter(data = steam_games, keyword = "Action", keyword_column = genre, x = original_price, y = achievements), kw_test)

})
