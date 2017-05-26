#' @export
ch_display <- function(x0, ...){
  UseMethod('ch_display')
}


#' @export
#' @importFrom highr hi_html
ch_display.ch_code_block <- function(x0, ...){
  x0$Output <- sapply(x0$Code, function(y){
    m <- eval(parse(text = y))
    paste(capture.output(m), collapse = "<br>")
  })
  x0$Code <- sapply(x0$Code, function(y){
    htmlize(tags$code(class='hl', HTML(hi_html((y)))))
  })
  ch_table(x0)
}

#' @export
#' @importFrom commonmark markdown_html
ch_display.ch_rmd_block <- function(x0, ...){
  HTML(commonmark::markdown_html(x0$RmdBlock[1]))
}

#' @export
ch_block <- function(y){
  nm <- names(y)
  if (nm[1] == "Code"){
    class(y) <- c('ch_code_block', class(y))
  } else {
    class(y) <- c('ch_rmd_block', class(y))
  }
  return(y)
}

#' @export
make_cheatsheet <- function(gs_data, title = 'Cheat Sheet'){
  gs_data$Layout <- as.list(gs_data$Layout)
  gs_data$Layout <- lapply(gs_data$Layout, function(x){x[!is.na(x)]})
  navbar <- ch_navbar(title,
    navItem(icon('play'), 'Tour', href='#'),
    navItem(icon('cog'), 'About', href='#')
  )
  columns <- lapply(names(gs_data$Layout), function(d){
    sheet_names <- gs_data$Layout[[d]]
    l <- lapply(sheet_names, function(z){
      blk <- ch_block(gs_data[[z]])
      ch_panel(ch_display(blk), z)
    })
    tagList(l)
  })
  names(columns) <- names(gs_data$Layout)

  components <- lapply(columns, function(d){
    ch_column(width = 12 %/% length(columns), d)
  })

  cheatsheet(
    navbar,
    ch_row(components)
  )
}
