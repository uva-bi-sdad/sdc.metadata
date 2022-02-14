#' Search Metadata
#'
#' Search for entries in metadata
#'
#' @import dataverse
#' @export
#' @examples
#' \dontrun{search_metadata()}

search_metadata <- function(yml){
  for(i in 1:length(yml)){
    if(length(yml[[i]]) == 1){
      statement <- paste0(length(yml[[i]]), " element inside ", ifelse(is.null(names(yml[i])), paste0("[",i,"]"), names(yml[i])))
      print(statement)
      print(paste0("Element is ", yml[[i]]))
    }
    else{
      statement <- paste0(length(yml[[i]]), " elements inside ", ifelse(is.null(names(yml[i])), paste0("[",i,"]"), names(yml[i])))
      print(statement)}
  }
}
