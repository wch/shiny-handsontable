#' Table output, rendered with an interactive handsontable
#'
#' @param expr An expression that returns a data frame or matrix.
#' @param env The environment in which to evaluate \code{expr}.
#' @param ... Other properties or elements to include.
#'
#' @seealso \code{\link{handsontableOutput}}
#'
#' @examples
#' \dontrun{
#' shinyUI(bootstrapPage(
#'
#' ))
#' }
#' @export
renderHandsontable <- function(expr, ..., env=parent.frame(), quoted=FALSE) {
  func <- exprToFunction(expr, env, quoted)

  function() {
    data <- func()
    if (is.null(data))
      data <- data.frame()

    return(list(
      colnames = names(data),
      rownames = row.names(data),
      values = unname(data)
    ))
  }
}


#' Create a handsontable output element
#'
#' @param outputId output variable to read the table from
#' @export
handsontableOutput <- function(outputId) {
  addResourcePath(
    prefix = "handsontable",
    directoryPath = system.file("handsontable", package="shinyHandsontable"))

  tagList(
    singleton(tags$head(
      tags$script(src = "handsontable/jquery.handsontable.full.js"),
      tags$link(rel = "stylesheet", type = "text/css", media = "screen",
                href = "handsontable/jquery.handsontable.full.css"),
      tags$script(src = "handsontable/shiny-handsontable.js")
    )),
    div(id = outputId, class = "handsontable shiny-handsontable-output")
  )
}

