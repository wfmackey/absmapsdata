# Ensure coordinates of 4326

library(sf)

# For all files in data/, recast to CRS 4326

recast_absmapsdata <- function(rda) {

  name <- gsub("\\.rda", "", rda)
  data_dir <- file.path("data", rda)

  load(file.path("data", rda))

  d <- get(name)

  d <- st_set_crs(d, st_crs(4326))

  assign(name, d)

  save(name, file = data_dir)
}

all_data <- list.files("data")

purrr::walk(all_data, recast_absmapsdata)
