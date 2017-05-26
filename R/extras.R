#' Create an icon
#'
#' @param x name of glyphicon
#' @param ... other attributes to add to the span element
#' @export
icon <- function(x, ...){
  tags$span(class = sprintf('glyphicon glyphicon-%s', x), ...)
}

#' Create a panel title
#'
#' @param title title
#' @param note note
#' @param idright id of span element created to the far right
#' @export
panel_title <- function(title, note = "", idright){
  tagList(
    tags$span(title),
    icon('info-sign',
        `data-content` = note,
        `data-toggle` = "popover",
        `data-html` = TRUE,
        style = "cursor:pointer;font-size:16px;"
    ),
    tags$span(id = idright, class='pull-right')
  )
}


#' @export
ch_table <- function (x, class = "table table-striped table-condensed"){
  tags$table(class = class, tags$tbody(tags$tr(lapply(names(x),
    tags$th)), apply(x, 1, function(d) {
      tags$tr(lapply(d, function(x) tags$td(HTML(x))))
  })))
}

htmlize <- function(x){HTML(as.character(x))}

#' @export
#' @import readxl
read_all_sheets <- function(path){
  sheet_names <- readxl::excel_sheets(fpath)
  all_sheets <- lapply(sheets, readxl::read_excel, path = fpath)
  names(all_sheets) <- sheet_names
  all_sheets
}

