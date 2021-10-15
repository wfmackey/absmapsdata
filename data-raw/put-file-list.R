# put list of files

library(tidyverse)

current_list <- tibble(files = list.files("data") %>%
                             stringr::str_remove("\\.rda"))

write_csv(current_list, "data-raw/absmapsdata-file-list.csv", col_names = FALSE)
