library(tidyverse)
library(rgdal)
library(sf)

# Load MapInfo file
# Note: File too large to hold original in the package
postcodes_url <- "https://www.abs.gov.au/ausstats/subscriber.nsf/log?openagent&1270055003_poa_2016_aust_midmif.zip&1270.0.55.003&Data%20Cubes&0640C1D30EE51383CA25802C001477DE&0&July%202016&13.09.2016&Previous"
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

head(compressed)
glimpse(compressed)

compressed$POA_CODE_2016 %>% unique()

# Tidy
postcode2016 <-
  compressed %>%
  mutate(postcode_2016 = as.character(POA_CODE_2016),
         postcode_num_2016 = as.numeric(postcode_2016)) %>%
  select(postcode_2016,
         postcode_num_2016,
         cent_lat = Y,
         cent_long = X,
         geometry)

# Save
save(postcode2016, file = "data/postcode2016.rda", compress = "xz")



