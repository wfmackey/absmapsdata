library(tidyverse)
library(rgdal)
library(sf)

# Load MapInfo file
# Note: File too large to hold original in the package
postcodes_url <- "https://www.abs.gov.au/AUSSTATS/subscriber.nsf/log?openagent&1270055003_lga_2011_aust_shape.zip&1270.0.55.003&Data%20Cubes&4A320EE17A293459CA257937000CC967&0&July%202011&31.10.2011&Previous"
temp_path <- "~/Downloads/pc"

download.file(postcodes_url, paste0(temp_path, ".zip"))

unzip(temp_path, exdir = temp_path)

raw <- readOGR(temp_path)

# Convert to sf object
sf_object <- st_as_sf(raw)

# Add centroids
add_cent <- cbind(sf_object, sf::st_coordinates(sf::st_centroid(sf_object)))

# Compress
compressed <- rmapshaper::ms_simplify(add_cent, keep = .1, keep_shapes = TRUE)


# Tidy
lga2011 <-
  compressed %>%
  select(lga_code_2011 = 1,
         lga_name_2011 = 2,
         state_code_2011 = 3,
         state_name_2011 = 4,
         areasqkm_2011 = 5,
         cent_lat = Y,
         cent_long = X,
         geometry)

# Save
save(lga2011, file = "data/lga2011.rda", compress = "xz")



