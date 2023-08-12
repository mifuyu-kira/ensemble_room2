data_raw <- read.csv("Data/owid-co2-data.csv")

data <- data_raw |> 
  dplyr::select(
    country,
    year,
    gdp,
    population,
    co2_per_capita
  )
