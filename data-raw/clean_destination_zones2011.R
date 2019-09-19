library(tidyverse)
library(rgdal)
library(sf)

dz_url <- "https://www.abs.gov.au/ausstats/subscriber.nsf/log?openagent&80000_dzn_2011_aust_shape.zip&8000.0&Data%20Cubes&9089DA91690E4DB0CA257ACD00119076&0&August%202011&10.12.2012&Latest"

temp_path <- "~/Downloads/dz11"

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
dz2011 <-
  compressed %>%
  mutate_at(vars(-X, -Y, -geometry), as.character) %>%
  select(dz_code_2011 = DZN_CODE11,
         sa2_code_2011 = SA2_MAIN11,
         sa2_shortcode_2011 = SA2_5DIG11,
         sa2_name_2011 = SA2_NAME11,
         state_code_2011 = STE_CODE11,
         state_name_2011 = STE_NAME11,
         areasqkm_2011 = AREA_SQKM,
         cent_lat = Y,
         cent_long = X,
         geometry)

# Save
save(dz2011, file = "data/dz2011.rda", compress = "xz")


