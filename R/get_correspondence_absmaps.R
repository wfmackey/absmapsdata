#' Read in ASGC/ASGS 2016 population-weighted correspondence tables from the ABS.
#'
#' Source: \url{https://data.gov.au/dataset/ds-dga-23fe168c-09a7-42d2-a2f9-fd08fbd0a4ce/details?q=}
#' @name get_correspondence_absmaps
#' @param fromArea The area you want to correspond FROM (ie the areas your data are currently in). For example: "sa1", "sa2, "sa3", "sa4".
#' @param fromYear The year you want to correspond FROM. For example: 2011, 2016.
#' @param toArea The area you want to correspond TO (ie the areas you want your data to be in).
#' @param toYear The year you want to correspond TO.
#'
#' @return A \code{tibble} object.
#' @examples
#' \dontrun{
#' sa4_corr <- get_correspondence_absmaps("sa4", 2011, "sa4", 2016)
#' lga2011_to_2018 <- get_correspondence_absmaps("LGA", 2011, "LGA", 2018)
#' }
#'
#' @export

get_correspondence_absmaps <- function(fromArea, fromYear, toArea, toYear) {

  filename <- paste(
    "CG",
    toupper(fromArea), fromYear,
    toupper(toArea), toYear,
    sep = "_"
  )

  corr <- get(filename)

  return(corr)

}

