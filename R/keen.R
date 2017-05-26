#' Create a chart panel
#'
#'
#'
#' @param chart chart object to wrap
#' @param cols grid width of the column. can be a named vector to allow for
#'   different column sizes based on screen size.
#' @param title panel title to be displayed at the top
#' @param notes panel notes to be displayed at the bottom
#' @param id id for panel element
#' @export
ch_panel <- function(chart, title = "", notes = "",
    id = paste0("panel-", round(runif(1)*10000, 0))){
  #ch_column(cols,
  tagList(
    div(class = "chart-wrapper", id = id,
      div(class = "chart-title chart-cheatsheet-title", title),
      div(class = "chart-stage", chart),
      if (notes!= "") div(class = "chart-notes", notes) else NULL
    )
  )
}

#' Create a navbar at the top of the page
#'
#' @param brand title to display on far left of navbar
#' @param ... other elements in navbar
#' @export
ch_navbar <- function(brand, ...){
  m <- list(...)
  y <- div(class = "navbar-collapse collapse",
    tags$ul(class = "nav navbar-nav navbar-left",
      do.call('tagList', m)
    )
  )
  x <- make_collapsible(brand, y)

  div(class = "navbar navbar-inverse navbar-fixed-top",
    role = "navigation", x
  )
}

#' Create a column
#'
#' @param width the grid width of the column
#' @param ... elements to include within the column
#' @param offset the number of columns to offset this column
#' @param id id for the column
#'
#' @export
ch_column <- function(width, ..., offset = NULL,
    id = paste0('column-', round(runif(1)*10000))){
  if (length(width) == 1){
    if (is.null(names(width))) width = c(md = width) else width = width
  } else if (is.null(names(width))){
    names(width) <- c('xs', 'sm', 'md', 'lg')[seq_along(width)]
  }
  if (!is.null(offset)){
    if (length(offset) == 1){
      offset = c(md = offset)
    } else if (is.null(names(offset))){
      names(offset) <- c('xs', 'sm', 'md', 'lg')[seq_along(offset)]
    }
  }
  col_class = paste('col', names(width), width, sep = '-')
  if (!is.null(offset)){
    off_class = paste0('col-', names(offset), '-offset-', offset)
    col_class = c(col_class, off_class)
  }
  div(class = paste(col_class, collapse = " "), id = id, ...)
}


#' Create a row
#'
#' @param ... elements to include within a row
#' @export
ch_row <- function(...){
  div(class = "row", ...)
}



#' Create an item in the navbar
#'
#' @param ... attributes for an a element
#' @export
navItem <- function(...){
  tags$li(a(...))
}



# Create collapsible bars
make_collapsible <- function(brand, y){with(tags,
 div(class = "container-fluid",
    div(class = 'navbar-header',
      button(type = 'button', class='navbar-toggle',
        `data-toggle` = "collapse", `data-target` = ".navbar-collapse",
        span("Toggle Navigation", class = "sr-only"),
        span(class = "icon-bar"),
        span(class = "icon-bar"),
        span(class = "icon-bar")
      ),
      a(brand, class = "navbar-brand", href = "")
    ),
    y
  )
)}

#' List items for navbar
#'
#' @param ... list items
#' @export
navList = function(...){
  m = list(...)
  tags$ul(class = "nav navbar-nav navbar-left", do.call('tagList', m))
}


#' Create a navbar at the top of the page
#'
#' @param brand title to display on far left of navbar
#' @param ... other elements in navbar
#' @export
Navbar2 = function(brand, ...){
  m <- list(...)
  y <- div(class = "navbar-collapse collapse", m)
  x <- make_collapsible(brand, y)

  div(class = "navbar navbar-inverse navbar-fixed-top",
    role = "navigation", x
  )
}
