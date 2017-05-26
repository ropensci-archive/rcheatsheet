# Add an html dependency, without overwriting existing ones
# https://github.com/rstudio/shinydashboard/blob/master/R/deps.R
appendDependencies <- function(x, value) {
  if (inherits(value, "html_dependency"))
    value <- list(value)
  old <- attr(x, "html_dependencies", TRUE)
  htmlDependencies(x) <- c(old, value)
  x
}

lib.file <- function(...){
  system.file(file.path('htmlwidgets', 'lib', ...), package = 'rcheatsheet')
}

# Add dashboard dependencies to a tag object
addDeps <- function(x) {
  dashboardDeps <- list(
    htmlDependency("jquery", '2.1.3',
      c(file = lib.file('jquery', 'dist')),
      script = "jquery.min.js"
    ),
    htmlDependency("bootstrap", '3.2.0',
      c(file = lib.file('bootstrap', 'dist')),
      script = "js/bootstrap.min.js",
      stylesheet = "css/bootstrap.min.css"
    ),
    htmlDependency("keen", '1.0.0',
      c(file = lib.file('keen')),
      stylesheet = "keen-dashboards.css"
    )
  )
  appendDependencies(x, dashboardDeps)
}
