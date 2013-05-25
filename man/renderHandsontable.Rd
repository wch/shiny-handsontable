\name{renderHandsontable}
\alias{renderHandsontable}
\title{Table output, rendered with an interactive handsontable}
\usage{
  renderHandsontable(expr, ..., env = parent.frame(),
    quoted = FALSE)
}
\arguments{
  \item{expr}{An expression that returns a data frame or
  matrix.}

  \item{env}{The environment in which to evaluate
  \code{expr}.}

  \item{...}{Other properties or elements to include.}
}
\description{
  Table output, rendered with an interactive handsontable
}
\examples{
\dontrun{
shinyUI(bootstrapPage(

))
}
}
\seealso{
  \code{\link{handsontableOutput}}
}

