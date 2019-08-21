library(tidyverse)
library(rgdal)
library(sf)

# Load MapInfo file
# Note: File too large to hold original in the package
raw <- readOGR("~/Downloads/IVI Mapinfo files")

# Convert to sf object
sf_object <- st_as_sf(raw)

# Add centroids
add_cent <- cbind(sf_object, sf::st_coordinates(sf::st_centroid(sf_object)))

# Compress
compressed <- rmapshaper::ms_simplify(add_cent, keep = .1, keep_shapes = TRUE)

# Tidy
regional_ivi2008 <- compressed %>%
  mutate(State_Code = if_else(ESA_Name_Sept_2008 == "Canberra & ACT", 8, as.numeric(State_Code)),
         state_name = case_when(
            State_Code == 1 ~ "NSW",
            State_Code == 2 ~ "Vic",
            State_Code == 3 ~ "Qld",
            State_Code == 4 ~ "SA",
            State_Code == 5 ~ "WA",
            State_Code == 6 ~ "Tas",
            State_Code == 7 ~ "NT",
            State_Code == 8 ~ "ACT",
            State_Code == 9 ~ "Other")) %>%
  select(region_name = ESA_Name_Sept_2008,
         state_name,
         state_code = State_Code,
         cent_lat = Y,
         cent_long = X,
         geometry)

# Save
save(regional_ivi2008, file = "data/regional_ivi2008.rda", compress = "xz")

