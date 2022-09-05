
library(tidyverse)
library(rgdal)
library(sf)


read_shape <- function(folder_path,
                       tidy_vars = TRUE, # select and rename key variables
                       include_aus = FALSE, # include aus_code_2021 and aus_name_2021 variables
                       add_vars = NULL, # vars to add
                       compress_level = 0.1) {


  # Set variables to keep
  select_vars <- c(
    "sa1_code_2021" = "SA1_CODE21",
    "sa2_code_2021" = "SA2_CODE21",
    "sa2_name_2021" = "SA2_NAME21",
    "sa3_code_2021" = "SA3_CODE21",
    "sa3_name_2021" = "SA3_NAME21",
    "sa4_code_2021" = "SA4_CODE21",
    "sa4_name_2021" = "SA4_NAME21",
    "gcc_code_2021" = "GCC_CODE21",
    "gcc_name_2021" = "GCC_NAME21",
    "suburb_name_2021" = "SAL_NAME21",
    "suburb_code_2021" = "SAL_CODE21",
    "suburb_name_2016" = "SSC_NAME16",
    "suburb_code_2016" = "SSC_CODE16",
    "postcode_2021" = "POA_NAME21",
    "sed_code_2021" = "SED_CODE21",
    "sed_name_2021" = "SED_NAME21",
    "ced_code_2021" = "CED_CODE21",
    "ced_name_2021" = "CED_NAME21",
    "lga_code_2021" = "LGA_CODE21",
    "lga_name_2021" = "LGA_NAME21",
    "tourism_code_2021" = "TR_CODE21",
    "tourism_name_2021" = "TR_NAME21",
    "postcode_num_2021" = "POA_CODE21",
    "dz_code_2021" = "DZN_CODE21",
    "state_code_2021" = "STE_CODE21",
    "state_name_2021" = "STE_NAME21",
    "state_code_2016" = "STE_CODE16",
    "state_name_2016" = "STE_NAME16",
    "areasqkm_2021" = "AREASQKM21",
    "areasqkm_2016" = "AREASQKM16",
    "cent_lat", "cent_long"
  )

  if (include_aus) {
    select_vars <- c(select_vars,
                     "aus_code_2021" = "AUS_CODE21",
                     "aus_name_2021" = "AUS_NAME21"
    )
  }

  if (!is.null(add_vars)) {
    select_vars <- c(select_vars, add_vars)
  }

  path <- gsub("\\.zip", "", folder_path)

  # If the file is zipped, unzip it
  if (grepl("\\.zip$", folder_path)) {
    unzip(zipfile = folder_path, exdir = path)
  }

  # Import sf object at correct CRS
  sf_object <- sf::read_sf(path) %>%
    sf::st_transform(4326)

  if (grepl("\\.zip$", folder_path)) {
    walk(list.files(path, full.names = TRUE), file.remove)
    file.remove(path)
  }

  # Add centroids
  add_cent <- cbind(sf_object,
                    sf::st_coordinates(sf::st_centroid(sf_object)))

  # Compress
  compressed <- rmapshaper::ms_simplify(add_cent,
                                        keep = compress_level,
                                        keep_shapes = TRUE)

  # Tidy
  tidy <- compressed %>%
    mutate(across(c(-X, -Y, -starts_with("areasqkm"), -geometry), as.character)) %>%
    # always do this:
    rename(cent_lat = Y,
           cent_long = X)

  if (!is.null(tidy_vars)) tidy <- tidy %>% select(any_of(select_vars))

  return(tidy)

}
