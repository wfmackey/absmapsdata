library(tidyverse)
library(rio)
library(glue)
library(here)
library(crayon)
# Read correspondences


loc <- here("data-raw", "asgs2016_2016gridcorrespondences")

file_list <- list.files(loc) %>%
  .[!str_detect(., ".pdf$")] %>%
  .[!str_detect(., "^\\~\\$")] %>%
  .[!str_detect(., "Generator")] %>%
  .[!str_detect(., "- All")] # a duplicate of an xlsx file; ignore

name_only_list <- str_remove_all(file_list, "\\.xlsx?")

direct_list <- here("data-raw", "asgs2016_2016gridcorrespondences", file_list)



clean_correspondences <- function(x) {

message(glue_col("{silver Reading {x}: {direct_list[x]}}"))



if (str_ends(file_list[x], ".xlsx?")) {
  # Some correspondences go over two sheets labelled 3a and 3b
  sheets <- excel_sheets(direct_list[x])
  if ("Table 3" %in% sheets) {
  a <- read_excel(direct_list[x], sheet = "Table 3", skip = 4, col_types = "text") %>%
    drop_na(1:4) %>%
    as_tibble()
  }
  if ("Table 3a" %in% sheets & "Table 3b" %in% sheets) {
    a <- read_excel(direct_list[x], sheet = "Table 3a", skip = 4, col_types = "text") %>%
      drop_na(1:4) %>%
      as_tibble()

    b <- read_excel(direct_list[x], sheet = "Table 3b", skip = 4, col_types = "text") %>%
      drop_na(1:4) %>%
      as_tibble()

    a <- bind_rows(a, b)
  }
}

if (str_ends(direct_list[x], ".csv")) {
  a <- read_csv(direct_list[x])
}

nam <- names(a) %>%
  str_remove_all("\\.\\.\\.[0-9]")

same_1_2 <- nam[1] == nam[2]
same_3_4 <- nam[3] == nam[4]

if (same_1_2 & same_3_4) {
  a <- select(a, -2, -4)
}
if (same_1_2 & !same_3_4) {
  a <- select(a, -2)
}
if (!same_1_2 & same_3_4) {
  a <- select(a, -4)
}

# Remove dots from names and make snake_case
names(a) <- names(a) %>%
  str_remove_all("\\.\\.\\.[0-9]") %>%
  janitor::make_clean_names()

# Rename RATIO_FROM_TO to ratio
names(a) <- str_replace(names(a), "RATIO_FROM_TO", "ratio")

# Assert there is a ratio variable
if (!any(names(a) == "ratio")) stop(glue("ratio variable not found in {file_list[x]}"))

# Remove percentage variable
if (any(names(a) == "percentage")) a <- select(a, -percentage)
if (any(names(a) == "percent")) a <- select(a, -percent)

# Keep codes/names as charactes; ratio to numeric
a <- a %>%
  mutate(ratio = as.numeric(ratio))

assign(name_only_list[x],
       a,
       envir = .GlobalEnv)

  message(glue_col("{green File read with {ncol(a)} columns and {nrow(a)} rows}"))
  if (ncol(a) > 5) warning(glue_col("{{ncol(a)} variables are: {print(names(a))}}"))

}

# Walk function over all filenames
purrr::walk(1:length(direct_list), clean_correspondences)

# Save the 201 unique objects
save_obs <- ls() %>%
  .[str_starts(., "CG|CA")]

save(list = save_obs, file = "R/sysdata.rda", compress = "xz")


