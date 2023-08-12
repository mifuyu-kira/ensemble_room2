data_raw <- read.csv("Data/owid-co2-data.csv")

data <- data_raw |> 
  dplyr::select(
    country,
    year,
    gdp,
    population,
    co2_per_capita
  ) |> 
  dplyr::filter(
    !is.na(gdp)
  )|>
  dplyr::mutate(
    gdp_per_capita = gdp/population
  )

data_japan <- data |> 
  dplyr::filter(
    country == "Japan"
  )

data_filtered <- data |> 
  dplyr::filter(
    country == c("Japan","United States")
  )

ggplot2::ggplot(data=data_japan,
                ggplot2::aes(
                  x = gdp_per_capita,
                  y = co2_per_capita
                )) + 
  ggplot2::geom_line()

ggplot2::ggplot(data=data_filtered,
                ggplot2::aes(
                  x = gdp_per_capita,
                  y = co2_per_capita,
                  color = country
                )) + 
  ggplot2::geom_line() +
  ggplot2::facet_wrap(~country) +
  ggplot2::geom_point() +
  ggplot2::labs(
    x = "GDP per Capita",
    y = "CO2 per Capita",
    title = "GDP & CO2"
  ) +
  ggplot2::theme_bw()

ggplot2::ggsave("")





