library(tidyverse)
library(sf)

# Preparing Significant Urban Areas, Urban Centres and Localities,
# Section of State, July 2016 --------------------------------------------------
# Source: https://www.abs.gov.au/AUSSTATS/abs@.nsf/DetailsPage/1270.0.55.004July%202016?OpenDocument

ucl <- read_shape(folder_path = "~/Downloads/1270055004_ucl_2016_aust_shape")
sos <- read_shape(folder_path = "~/Downloads/1270055004_sos_2016_aust_shape")
sosr <- read_shape(folder_path = "~/Downloads/1270055004_sosr_2016_aust_shape")
sua <- read_shape(folder_path = "~/Downloads/1270055004_sua_2016_aust_shape")

# and tourism
tourism <- read_shape(folder_path = "~/Downloads/1270055003_tr_2016_aust_shape.zip")


# Tidy and save ----------------------------------------------------------------
sua2016 <- sua %>%
  select(sua_code_2016 = SUA_CODE16,
         sua_name_2016 = SUA_NAME16,
         areasqkm_2016 = AREASQKM16,
         cent_lat = Y,
         cent_long = X,
         geometry)

save(sua2016, file = "data/sua2016.rda", compress = "xz")


sos2016 <- sos %>%
  select(sos_code_2016 = SOS_CODE16,
         sos_name_2016 = SOS_NAME16,
         state_code_2016 = STE_CODE16,
         state_name_2016 = STE_NAME16,
         areasqkm_2016 = AREASQKM16,
         cent_lat = Y,
         cent_long = X,
         geometry)

save(sos2016, file = "data/sos2016.rda", compress = "xz")


sosr2016 <- sosr %>%
  select(ssr_code_2016 = SSR_CODE16,
         ssr_name_2016 = SSR_NAME16,
         sos_code_2016 = SOS_CODE16,
         sos_name_2016 = SOS_NAME16,
         state_code_2016 = STE_CODE16,
         state_name_2016 = STE_NAME16,
         areasqkm_2016 = AREASQKM16,
         cent_lat = Y,
         cent_long = X,
         geometry)

save(sosr2016, file = "data/sosr2016.rda", compress = "xz")


ucl2016 <- ucl %>%
  select(ucl_code_2016 = UCL_CODE16,
         ucl_name_2016 = UCL_NAME16,
         ssr_code_2016 = SSR_CODE16,
         ssr_name_2016 = SSR_NAME16,
         sos_code_2016 = SOS_CODE16,
         sos_name_2016 = SOS_NAME16,
         state_code_2016 = STE_CODE16,
         state_name_2016 = STE_NAME16,
         areasqkm_2016 = AREASQKM16,
         cent_lat = Y,
         cent_long = X,
         geometry)

save(ucl2016, file = "data/ucl2016.rda", compress = "xz")


tourism2016 <- tourism  %>%
  select(tourism_code_2016 = TR_CODE16,
         tourism_name_2016 = TR_NAME16,
         state_code_2016 = STE_CODE16,
         state_name_2016 = STE_NAME16,
         areasqkm_2016 = AREASQKM16,
         cent_lat = Y,
         cent_long = X,
         geometry)

save(tourism2016, file = "data/tourism2016.rda", compress = "xz")
