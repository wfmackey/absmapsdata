
test_that("all objects are sf objects", {
  expect_s3_class(ced2018, class = c("sf", "data.frame"))
  expect_s3_class(ced2021, class = c("sf", "data.frame"))
  expect_s3_class(dz2011, class = c("sf", "data.frame"))
  expect_s3_class(dz2016, class = c("sf", "data.frame"))
  expect_s3_class(dz2021, class = c("sf", "data.frame"))
  expect_s3_class(gcc2011, class = c("sf", "data.frame"))
  expect_s3_class(gcc2016, class = c("sf", "data.frame"))
  expect_s3_class(lga2011, class = c("sf", "data.frame"))
  expect_s3_class(lga2016, class = c("sf", "data.frame"))
  expect_s3_class(lga2018, class = c("sf", "data.frame"))
  expect_s3_class(postcode2016, class = c("sf", "data.frame"))
  expect_s3_class(postcode2021, class = c("sf", "data.frame"))
  expect_s3_class(suburb2016, class = c("sf", "data.frame"))
  expect_s3_class(suburb2021, class = c("sf", "data.frame"))
  expect_s3_class(ra2011, class = c("sf", "data.frame"))
  expect_s3_class(ra2016, class = c("sf", "data.frame"))
  expect_s3_class(regional_ivi2008, class = c("sf", "data.frame"))
  expect_s3_class(sa12011, class = c("sf", "data.frame"))
  expect_s3_class(sa12016, class = c("sf", "data.frame"))
  expect_s3_class(sa12021, class = c("sf", "data.frame"))
  expect_s3_class(sa22011, class = c("sf", "data.frame"))
  expect_s3_class(sa22016, class = c("sf", "data.frame"))
  expect_s3_class(sa22021, class = c("sf", "data.frame"))
  expect_s3_class(sa32011, class = c("sf", "data.frame"))
  expect_s3_class(sa32016, class = c("sf", "data.frame"))
  expect_s3_class(sa32021, class = c("sf", "data.frame"))
  expect_s3_class(sa42011, class = c("sf", "data.frame"))
  expect_s3_class(sa42016, class = c("sf", "data.frame"))
  expect_s3_class(sa42021, class = c("sf", "data.frame"))
  expect_s3_class(sed2018, class = c("sf", "data.frame"))
  expect_s3_class(sed2021, class = c("sf", "data.frame"))
  expect_s3_class(sos2016, class = c("sf", "data.frame"))
  expect_s3_class(sosr2016, class = c("sf", "data.frame"))
  expect_s3_class(state2011, class = c("sf", "data.frame"))
  expect_s3_class(state2016, class = c("sf", "data.frame"))
  expect_s3_class(sua2016, class = c("sf", "data.frame"))
  expect_s3_class(tourism2016, class = c("sf", "data.frame"))
  expect_s3_class(tourism2021, class = c("sf", "data.frame"))
  expect_s3_class(ucl2016, class = c("sf", "data.frame"))
})


test_that("all objects are the right CRS", {
  expect_equal(sf::st_crs(ced2018)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(ced2021)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(dz2011)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(dz2016)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(dz2021)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(gcc2011)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(gcc2016)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(lga2011)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(lga2016)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(lga2018)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(lga2021)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(postcode2016)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(postcode2021)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(suburb2016)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(suburb2021)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(ra2011)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(ra2016)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(regional_ivi2008)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(sa12011)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(sa12016)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(sa12021)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(sa22011)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(sa22016)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(sa22021)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(sa32011)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(sa32016)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(sa32021)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(sa42011)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(sa42016)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(sa42021)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(sed2018)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(sed2021)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(sos2016)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(sosr2016)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(state2011)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(state2016)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(sua2016)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(tourism2016)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(tourism2021)[[1]], "EPSG:4326")
  expect_equal(sf::st_crs(ucl2016)[[1]], "EPSG:4326")
})

test_that("names are consistent", {

  correct_names2021 <- c(
    "sa1_code_2021",
    "sa2_code_2021",
    "sa2_name_2021",
    "sa3_code_2021",
    "sa3_name_2021",
    "sa4_code_2021",
    "sa4_name_2021",
    "gcc_code_2021",
    "gcc_name_2021",
    "state_code_2021",
    "state_name_2021",
    "areasqkm_2021",
    "cent_lat",
    "cent_long",
    "geometry"
  )

  correct_names2016 <- c(
    "sa1_code_2016",
    "sa1_7dig_2016",
    "sa2_code_2016",
    "sa2_name_2016",
    "sa2_5dig_2016",
    "sa3_code_2016",
    "sa3_name_2016",
    "sa4_code_2016",
    "sa4_name_2016",
    "gcc_code_2016",
    "gcc_name_2016",
    "state_code_2016",
    "state_name_2016",
    "areasqkm_2016",
    "cent_lat",
    "cent_long",
    "geometry"
  )

  correct_names2011 <- c(
    "sa1_code_2011",
    "sa1_7dig_2011",
    "sa2_code_2011",
    "sa2_name_2011",
    "sa2_5dig_2011",
    "sa3_code_2011",
    "sa3_name_2011",
    "sa4_code_2011",
    "sa4_name_2011",
    "gcc_code_2011",
    "gcc_name_2011",
    "state_code_2011",
    "state_name_2011",
    "areasqkm_2011",
    "cent_lat",
    "cent_long",
    "geometry"
  )

  expect_true(all(names(sa12011) %in% correct_names2011))
  expect_true(all(names(sa22011) %in% correct_names2011))
  expect_true(all(names(sa32011) %in% correct_names2011))
  expect_true(all(names(sa42011) %in% correct_names2011))
  expect_true(all(names(gcc2011) %in% correct_names2011))
  expect_true(all(names(state2011) %in% correct_names2011))

  expect_true(all(names(sa12016) %in% correct_names2016))
  expect_true(all(names(sa22016) %in% correct_names2016))
  expect_true(all(names(sa32016) %in% correct_names2016))
  expect_true(all(names(sa42016) %in% correct_names2016))
  expect_true(all(names(gcc2016) %in% correct_names2016))
  expect_true(all(names(state2016) %in% correct_names2016))

  expect_true(all(names(sa12021) %in% correct_names2021))
  expect_true(all(names(sa22021) %in% correct_names2021))
  expect_true(all(names(sa32021) %in% correct_names2021))
  expect_true(all(names(sa42021) %in% correct_names2021))
  expect_true(all(names(gcc2021) %in% correct_names2021))
  expect_true(all(names(state2021) %in% correct_names2021))

})

