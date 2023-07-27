source("data-raw/read_shape.R")


# Read NSW LHD
## two layers, read separately
nsw_lhd_2023_metro <- st_read(
    "data-raw/new-data/Local Health Districts.kml",
    layer = "Metropolitan local health districts") %>%
  st_zm() # remove 'Z' dimension of some geometries

nsw_lhd_2023_regional <- st_read(
    "data-raw/new-data/Local Health Districts.kml",
    layer = "Rural and regional NSW local health districts") %>%
  st_zm() # remove 'Z' dimension of some geometries

## combine
nsw_lhd2023 <- bind_rows(nsw_lhd_2023_metro,
                          nsw_lhd_2023_regional) %>%
  select(nsw_lhd_name = Name, geometry) %>%
  sf::st_transform(4326)


save(nsw_lhd2023, file = "data/nsw_lhd2023.rda", compress = "xz")
