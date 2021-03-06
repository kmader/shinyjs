#' Add/remove CSS class
#'
#' Add or remove a CSS class from an HTML element.\cr\cr
#' \strong{\code{addClass}} adds a CSS class, \strong{\code{removeClass}}
#' removes a CSS class, \strong{\code{toggleClass}} adds the class if it is
#' not set and removes the class if it is already set.\cr\cr
#' \strong{\code{addCssClass}}, \strong{\code{removeCssClass}}, and
#' \strong{\code{toggleCssClass}} are synonyms that may be safer to use if you're
#' working with S4 classes (since they don't mask any existing S4 functions).\cr\cr
#' If \code{condition} is given to \code{toggleClass}, that condition will be used
#' to determine if to add or remove the class. The class will be added if the
#' condition evaluates to \code{TRUE} and removed otherwise. If you find
#' yourself writing code such as \code{if (test()) addClass(id, cl) else removeClass(id, cl)}
#' then you can use \code{toggleClass} instead: \code{toggleClass(id, cl, test())}.\cr\cr
#' CSS is a simple way to describe how elements on a web page should be
#' displayed (position, colour, size, etc.).  You can learn the basics
#' at \href{http://www.w3schools.com/css/}{W3Schools}.
#'
#' @note If you use S4 classes, you should be aware of the fact that both S4 and
#' \code{shinyjs} use the \code{removeClass()} function. This means that when using S4,
#' it is recommended to use \code{removeCssClass()} from \code{shinyjs}, and to
#' use \code{methods::removeClass()} for S4 object.
#'
#' @param id The id of the element/Shiny tag
#' @param class The CSS class to add/remove
#' @param condition An optional argument to \code{toggleClass}, see 'Details' below.
#' @param selector JQuery selector of the elements to target. Ignored if the \code{id}
#' argument is given. For example, to add a certain class to all inputs with class x,
#' use \code{selector = "input.x"}
#' @seealso \code{\link[shinyjs]{useShinyjs}},
#' \code{\link[shinyjs]{runExample}},
#' \code{\link[shinyjs]{inlineCSS}},
#' @note \code{shinyjs} must be initialized with a call to \code{useShinyjs()}
#' in the app's ui.
#' @examples
#' if (interactive()) {
#'   library(shiny)
#'
#'   shinyApp(
#'     ui = fluidPage(
#'       useShinyjs(),  # Set up shinyjs
#'       # Add a CSS class for red text colour
#'       inlineCSS(list(.red = "background: red")),
#'       actionButton("btn", "Click me"),
#'       p(id = "element", "Watch what happens to me")
#'     ),
#'     server = function(input, output) {
#'       observeEvent(input$btn, {
#'         # Change the following line for more examples
#'         toggleClass("element", "red")
#'       })
#'     }
#'   )
#' }
#' \dontrun{
#'   # The shinyjs function call in the above app can be replaced by
#'   # any of the following examples to produce similar Shiny apps
#'   toggleClass(class = "red", id = "element")
#'   addClass("element", "red")
#'   removeClass("element", "red")
#' }
#'
#' ## toggleClass can be given an optional `condition` argument, which
#' ## determines if to add or remove the class
#' if (interactive()) {
#'   shinyApp(
#'     ui = fluidPage(
#'       useShinyjs(),
#'       inlineCSS(list(.red = "background: red")),
#'       checkboxInput("checkbox", "Make it red"),
#'       p(id = "element", "Watch what happens to me")
#'     ),
#'     server = function(input, output) {
#'       observe({
#'         toggleClass(id = "element", class = "red",
#'                     condition = input$checkbox)
#'       })
#'     }
#'   )
#' }
#' @name classFuncs
NULL

#' @export
#' @rdname classFuncs
addClass <- function(id = NULL, class = NULL, selector = NULL) {
  fxn <- "addClass"
  params <- list(id = id, class = class, selector = selector)
  jsFuncHelper(fxn, params)
}
#' @export
#' @rdname classFuncs
addCssClass <- addClass

#' @export
#' @rdname classFuncs
removeClass <- function(id = NULL, class = NULL, selector = NULL) {
  fxn <- "removeClass"
  params <- list(id = id, class = class, selector = selector)
  jsFuncHelper(fxn, params)
}
#' @export
#' @rdname classFuncs
removeCssClass <- removeClass

#' @export
#' @rdname classFuncs
toggleClass <- function(id = NULL, class = NULL, condition = NULL, selector = NULL) {
  fxn <- "toggleClass"
  params <- list(id = id, class = class, condition = condition,
                 selector = selector)
  jsFuncHelper(fxn, params)
}
#' @export
#' @rdname classFuncs
toggleCssClass <- toggleClass