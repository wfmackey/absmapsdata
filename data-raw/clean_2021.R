
source("data-raw/read_shape.R")


# Aus
aus2021 <- read_shape("data-raw/shapefiles/AUS_2021_AUST_SHP_GDA2020/",
                      include_aus = TRUE)

save(aus2021, file = "data/aus2021.rda", compress = "xz")


# State
state2021 <- read_shape("data-raw/shapefiles/STE_2021_AUST_SHP_GDA2020/")

save(state2021, file = "data/state2021.rda", compress = "xz")

# GCC
gcc2021 <- read_shape("data-raw/shapefiles/GCCSA_2021_AUST_SHP_GDA2020")

save(gcc2021, file = "data/gcc2021.rda", compress = "xz")


# SA4
sa42021 <- read_shape("data-raw/shapefiles/SA4_2021_AUST_SHP_GDA2020")

save(sa42021, file = "data/sa42021.rda", compress = "xz")


# SA3
sa32021 <- read_shape("data-raw/shapefiles/SA3_2021_AUST_SHP_GDA2020")

save(sa32021, file = "data/sa32021.rda", compress = "xz")


# SA2
sa22021 <- read_shape("data-raw/shapefiles/SA2_2021_AUST_SHP_GDA2020")

save(sa22021, file = "data/sa22021.rda", compress = "xz")


# SA1
sa12021 <- read_shape("data-raw/shapefiles/SA1_2021_AUST_SHP_GDA2020")

save(sa12021, file = "data/sa12021.rda", compress = "xz")


# POA
postcode2021 <- read_shape("data-raw/shapefiles/POA_2021_AUST_GDA2020_SHP") %>%
  mutate(postcode_num_2021 = as.numeric(postcode_num_2021))

save(postcode2021, file = "data/postcode2021.rda", compress = "xz")


# SED
sed2021 <- read_shape("data-raw/shapefiles/SED_2021_AUST_GDA2020_SHP")

save(sed2021, file = "data/sed2021.rda", compress = "xz")


# CED
ced2021 <- read_shape("data-raw/shapefiles/CED_2021_AUST_GDA2020_SHP")

save(ced2021, file = "data/ced2021.rda", compress = "xz")


# LGA
lga2021 <- read_shape("data-raw/shapefiles/LGA_2021_AUST_GDA2020_SHP")

save(lga2021, file = "data/lga2021.rda", compress = "xz")


# Tourism
tourism2021 <- read_shape("data-raw/shapefiles/TR_2021_AUST_GDA2020_SHP")

save(tourism2021, file = "data/tourism2021.rda", compress = "xz")


# Destination Zones
dz2021 <- read_shape("data-raw/shapefiles/DZN_2021_AUST_GDA2020_SHP/")

save(dz2021, file = "data/dz2021.rda", compress = "xz")

