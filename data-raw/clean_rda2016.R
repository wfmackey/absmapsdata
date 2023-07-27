
source("data-raw/read_shape.R")


rda2016 <- read_shape("data-raw/new-data/rda201516", add_centroids = FALSE)
usethis::use_data(rda2016, overwrite = TRUE)

