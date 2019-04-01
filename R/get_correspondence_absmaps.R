#' Read in ASGC/ASGS population-weighted correspondence tables from the ABS.
#' @name get_correspondence_absmaps
#' @param fromArea The area you want to correspond FROM (ie the areas your data are currently in). For example: "sa1", "sa2, "sa3", "sa4".
#' @param fromYear The year you want to correspond FROM. For example: 2011, 2016.
#' @param toArea The area you want to correspond TO (ie the areas you want your data to be in).
#' @param toYear The year you want to correspond TO.
#'
#' @return A \code{tibble} object.
#' @examples
#' \dontrun{
#' sa4_corr <- get_correspondence_absmaps("sa4", 2011,
#'                                        "sa4", 2016)
#' }

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

