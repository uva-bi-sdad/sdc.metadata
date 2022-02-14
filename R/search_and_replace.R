#' Search And Replace Metadata
#'
#' Search and replace entries in metadata
#'
#' @import dataverse
#' @export
#' @examples
#' \dontrun{search_and_replace()}

search_and_replace <- function(measures_info){
  print(names(measures_info))
  level1 <- readline(prompt = "Enter level 1 item: ")
  output <- ifelse(level1 %in% names(measures_info), TRUE, FALSE)
  if(output == TRUE){
    index <- which(names(measures_info) == level1)
    print(names(measures_info[[index]]))
    level2 <- readline(prompt = "Enter level 2 search: ")
    output <- ifelse(level2 %in% names(measures_info[[index]]), TRUE, FALSE)
    if(output == TRUE){
      index2 <- which(names(measures_info[[index]]) == level2)
      print(measures_info[[index]][[index2]])
      replace <- readline(prompt = "Replace content with: ")
      measures_info[[index]][[index2]] <- replace
      return(measures_info)
    }
    else
      print("Search item not found")
  }
  else
    print("Search item not found")
}
