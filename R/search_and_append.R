#' Search And Append Metadata
#'
#' Search and append entries in metadata
#'
#' @import dataverse
#' @export
#' @examples
#' \dontrun{search_and_append()}

search_and_append <- function(measures_info){
  print(names(measures_info))
  level1 <- readline(prompt = "Enter level 1 item: ")
  output <- ifelse(level1 %in% names(measures_info), TRUE, FALSE)
  if(output == TRUE){
    index <- which(names(measures_info) == level1)
    print(names(measures_info[[index]]))
    replace <- readline(prompt = "Append new content: ")
    measure_info <- measures_info[[index]]
    measure_info <- append(measure_info, replace)
    replace <- readline(prompt = "New content name: ")
    names(measure_info)[length(measure_info)] <- replace
    measures_info[[index]] <- measure_info
    return(measures_info)
  }
  else
    print("Search item not found")
}
