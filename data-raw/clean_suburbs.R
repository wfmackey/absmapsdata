
source("data-raw/read_shape.R")

suburb2016 <- read_shape(folder_path = "data-raw/shapefiles/1270055003_ssc_2016_aust_shape.zip")

save(suburb2016, file = "data/suburb2016.rda", compress = "xz")


suburb2021 <- read_shape(folder_path = "data-raw/shapefiles/SAL_2021_AUST_GDA2020_SHP.zip",
                      include_aus = FALSE)

save(suburb2021, file = "data/suburb2021.rda", compress = "xz")
