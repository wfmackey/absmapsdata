library(tidyverse)
library(rgdal)
library(sf)

dz_url <- "https://www.abs.gov.au/AUSSTATS/subscriber.nsf/log?openagent&80000_dzn_2016_aust_shape.zip&8000.0&Data%20Cubes&34BAC10F16F2DF77CA2580880017E297&0&August%202016&14.12.2016&Latest"

temp_path <- "~/Downloads/dz"

download.file(dz_url, paste0(temp_path, ".zip"))

unzip(paste0(temp_path, ".zip"), exdir = temp_path)

raw <- readOGR(temp_path)

# Convert to sf object
sf_object <- st_as_sf(raw)

# Add centroids
add_cent <- cbind(sf_object, sf::st_coordinates(sf::st_centroid(sf_object)))

# Compress
compressed <- rmapshaper::ms_simplify(add_cent, keep = .1, keep_shapes = TRUE)

# Tidy
dz2016 <-
  compressed %>%
  mutate_at(vars(-X, -Y, -geometry), as.character) %>%
  select(dz_code_2016 = DZN_CODE16,
         sa2_code_2016 = SA2_MAIN16,
         sa2_shortcode_2016 = SA2_5DIG16,
         sa2_name_2016 = SA2_NAME16,
         state_code_2016 = STE_CODE16,
         state_name_2016 = STE_NAME16,
         cent_lat = Y,
         cent_long = X,
         geometry)

# Save
save(dz2016, file = "data/dz2016.rda", compress = "xz")


