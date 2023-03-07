library(tidyverse)
library(rgdal)
library(sf)

# Load MapInfo file
# Note: File too large to hold original in the package
source_file_path <- "https://www.bitre.gov.au/sites/default/files/is_98-shape.zip"

raw <- readOGR("~/Downloads/is_98-shape")

# Convert to sf object
sf_object <- st_as_sf(raw)

# Add centroids
add_cent <- cbind(sf_object, sf::st_coordinates(sf::st_centroid(sf_object)))

# Compress
compressed <- rmapshaper::ms_simplify(add_cent, keep = .1, keep_shapes = TRUE)

# Tidy
bitre_work_zones2016 <- compressed %>%
  rename(cent_lat = Y,
         cent_long = X)

# Save
save(bitre_work_zones2016, file = "data/bitre_work_zones2016.rda", compress = "xz")


