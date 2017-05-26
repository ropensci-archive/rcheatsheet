#' @export
#' @import htmltools
cheatsheet <- function(...){
  html <- tags$div(class = "container-fluid", ...)
  html <- addDeps(html)
  htmltools::browsable(html)
}
