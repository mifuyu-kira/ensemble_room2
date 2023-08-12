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

ggplot2::ggplot(data=data_japan,
                ggplot2::aes(
                  x = gdp_per_capita,
                  y = co2_per_capita
                )) + 
  ggplot2::geom_line()






