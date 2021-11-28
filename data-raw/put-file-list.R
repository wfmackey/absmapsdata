# put list of files

library(tidyverse)

absmapsdata_file_list <- tibble(files = list.files("data") %>%
                                  stringr::str_remove("\\.rda"))

usethis::use_data(absmapsdata_file_list, overwrite = TRUE)
