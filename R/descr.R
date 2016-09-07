#' Describe dataset using psych::describe() function
#'
#' Alias function of \code{psych::describe()}
#' @param x A data frame or matrix
#' @param choice
#' @param ... Arguments to be passed to \code{psych::describe()}
#' @export
#' @examples
#' desc(mtcars)
#' desc(mtcars, boxplot = T)
#' bound_trim(c(1, 5, 9, 10), 0, 9)
#' bound_trim(rnorm(100), -1.96, 1.96)

descr <- function(x, choice=c("vars", "n", "mean", "sd", "median", "min", "max", "range"), ...){

	# pre
	stopifnot(require(psych))

	# content
	bres <- describe(x, ...)
	res <- bres[names(bres) %in% choice]

	# return
	return(res)

}
