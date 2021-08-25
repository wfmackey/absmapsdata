library(tidyverse)
library(rgdal)
library(sf)

# Load MapInfo file
# Note: File too large to hold original in the package
raw <- readOGR("~/Downloads/er2015")

# Convert to sf object
sf_object <- st_as_sf(raw) %>%
  st_set_crs(st_crs(4326))

# Compress
compressed <- rmapshaper::ms_simplify(sf_object, keep = .1, keep_shapes = TRUE)

# Tidy
employment_regions2015 <- compressed %>%
  select(employment_region_code_2015 = CODE,
         employment_region_name_2015 = NAME,
         geometry)
# Save
save(employment_regions2015, file = "data/employment_regions2015.rda", compress = "xz")

