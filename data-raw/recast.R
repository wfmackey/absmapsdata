# Ensure coordinates of 4326

library(sf)

load("data/dz2016.rda")
dz2016 <- st_set_crs(dz2016, st_crs(4326))
save(dz2016, file = "data/dz2016.rda", compress = "xz")

load("data/ucl2016.rda")
ucl2016 <- st_set_crs(ucl2016, st_crs(4326))
save(ucl2016, file = "data/ucl2016.rda", compress = "xz")

load("data/tourism2016.rda")
tourism2016 <- st_set_crs(tourism2016, st_crs(4326))
save(tourism2016, file = "data/tourism2016.rda", compress = "xz")

load("data/sua2016.rda")
sua2016 <- st_set_crs(sua2016, st_crs(4326))
save(sua2016, file = "data/sua2016.rda", compress = "xz")

load("data/state2016.rda")
state2016 <- st_set_crs(state2016, st_crs(4326))
save(state2016, file = "data/state2016.rda", compress = "xz")

load("data/state2011.rda")
state2011 <- st_set_crs(state2011, st_crs(4326))
save(state2011, file = "data/state2011.rda", compress = "xz")

load("data/sosr2016.rda")
sosr2016 <- st_set_crs(sosr2016, st_crs(4326))
save(sosr2016, file = "data/sosr2016.rda", compress = "xz")

load("data/sos2016.rda")
sos2016 <- st_set_crs(sos2016, st_crs(4326))
save(sos2016, file = "data/sos2016.rda", compress = "xz")

load("data/sed2018.rda")
sed2018 <- st_set_crs(sed2018, st_crs(4326))
save(sed2018, file = "data/sed2018.rda", compress = "xz")

load("data/sa42016.rda")
sa42016 <- st_set_crs(sa42016, st_crs(4326))
save(sa42016, file = "data/sa42016.rda", compress = "xz")

load("data/sa42011.rda")
sa42011 <- st_set_crs(sa42011, st_crs(4326))
save(sa42011, file = "data/sa42011.rda", compress = "xz")

load("data/sa32016.rda")
sa32016 <- st_set_crs(sa32016, st_crs(4326))
save(sa32016, file = "data/sa32016.rda", compress = "xz")

load("data/sa32011.rda")
sa32011 <- st_set_crs(sa32011, st_crs(4326))
save(sa32011, file = "data/sa32011.rda", compress = "xz")

load("data/sa22016.rda")
sa22016 <- st_set_crs(sa22016, st_crs(4326))
save(sa22016, file = "data/sa22016.rda", compress = "xz")

load("data/sa22011.rda")
sa22011 <- st_set_crs(sa22011, st_crs(4326))
save(sa22011, file = "data/sa22011.rda", compress = "xz")

load("data/sa12016.rda")
sa12016 <- st_set_crs(sa12016, st_crs(4326))
save(sa12016, file = "data/sa12016.rda", compress = "xz")

load("data/sa12011.rda")
sa12011 <- st_set_crs(sa12011, st_crs(4326))
save(sa12011, file = "data/sa12011.rda", compress = "xz")

load("data/regional_ivi2008.rda")
regional_ivi2008 <- st_set_crs(regional_ivi2008, st_crs(4326))
save(regional_ivi2008, file = "data/regional_ivi2008.rda", compress = "xz")

load("data/ra2016.rda")
ra2016 <- st_set_crs(ra2016, st_crs(4326))
save(ra2016, file = "data/ra2016.rda", compress = "xz")

load("data/ra2011.rda")
ra2011 <- st_set_crs(ra2011, st_crs(4326))
save(ra2011, file = "data/ra2011.rda", compress = "xz")

load("data/postcode2016.rda")
postcode2016 <- st_set_crs(postcode2016, st_crs(4326))
save(postcode2016, file = "data/postcode2016.rda", compress = "xz")

load("data/lga2018.rda")
lga2018 <- st_set_crs(lga2018, st_crs(4326))
save(lga2018, file = "data/lga2018.rda", compress = "xz")

load("data/lga2016.rda")
lga2016 <- st_set_crs(lga2016, st_crs(4326))
save(lga2016, file = "data/lga2016.rda", compress = "xz")

load("data/lga2011.rda")
lga2011 <- st_set_crs(lga2011, st_crs(4326))
save(lga2011, file = "data/lga2011.rda", compress = "xz")

load("data/gcc2016.rda")
gcc2016 <- st_set_crs(gcc2016, st_crs(4326))
save(gcc2016, file = "data/gcc2016.rda", compress = "xz")

load("data/gcc2011.rda")
gcc2011 <- st_set_crs(gcc2011, st_crs(4326))
save(gcc2011, file = "data/gcc2011.rda", compress = "xz")

load("data/dz2011.rda")
dz2011 <- st_set_crs(dz2011, st_crs(4326))
save(dz2011, file = "data/dz2011.rda", compress = "xz")

load("data/ced2018.rda")
ced2018 <- st_set_crs(ced2018, st_crs(4326))
save(ced2018, file = "data/ced2018.rda", compress = "xz")

