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

ggplot2::ggplot(data=data,
                aes(
                  x = gdp_per_capita,
                  y = co2_per_capita
                )) + 
  ggplot2::geom_line()

