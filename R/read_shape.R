#' Read and compress shape files for processing
#' @name read_shape
#' @param path Path to the original file
#' @param compress Compression level. Defaults to 0.1 (10%)
#' @return An sf object
#' @import stringr
#' @importFrom clipr write_clip
#' @export
#'


read_shape <- function(folder_path,
                       compress_level = 0.1) {

  path <- gsub("\\.zip", "", folder_path)

  # If the file is zipped, unzip it
  if (grepl("\\.zip$", folder_path)) {
    unzip(zipfile = folder_path, exdir = path)
  }

  # Import sf object
  sf_object <- sf::read_sf(path)

  # Add centroids
  add_cent <- cbind(sf_object,
                    sf::st_coordinates(sf::st_centroid(sf_object)))

  # Compress
  compressed <- rmapshaper::ms_simplify(add_cent,
                                        keep = compress_level,
                                        keep_shapes = TRUE)

  return(compressed)

}
