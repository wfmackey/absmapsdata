
source("data-raw/read_shape.R")


# Aus
aus2021 <- read_shape("data-raw/data/2021/AUS_2021_AUST_SHP_GDA2020/",
                      include_aus = TRUE)

save(aus2021, file = "data/aus2021.rda", compress = "xz")


# State
state2021 <- read_shape("data-raw/data/2021/STE_2021_AUST_SHP_GDA2020/")

save(state2021, file = "data/state2021.rda", compress = "xz")

# GCC
gcc2021 <- read_shape("data-raw/data/2021/GCCSA_2021_AUST_SHP_GDA2020")

save(gcc2021, file = "data/gcc2021.rda", compress = "xz")


# SA4
sa42021 <- read_shape("data-raw/data/2021/SA4_2021_AUST_SHP_GDA2020")

save(sa42021, file = "data/sa42021.rda", compress = "xz")


# SA3
sa32021 <- read_shape("data-raw/data/2021/SA3_2021_AUST_SHP_GDA2020")

save(sa32021, file = "data/sa32021.rda", compress = "xz")


# SA2
sa22021 <- read_shape("data-raw/data/2021/SA2_2021_AUST_SHP_GDA2020")

save(sa22021, file = "data/sa22021.rda", compress = "xz")


# SA1
sa12021 <- read_shape("data-raw/data/2021/SA1_2021_AUST_SHP_GDA2020")

save(sa12021, file = "data/sa12021.rda", compress = "xz")
