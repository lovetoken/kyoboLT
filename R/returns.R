#' Account X day returns
#'
#' Account X day returns
#' @param xts an \code{xts} object
#' @param Xday an integer value
#' @param log.returns logical asking whether to calculate log returns
#' @return xts type about returns dataset
#' @export
#' @examples
#' index <- matrix(rnorm(60,1000, 8^2), 20, 3)
#' data <- xts(round(index, 1), as.Date(16001:16020)) # xts package for time series data
#' names(data) <- paste("Fund", 1:3, sep = "_")
#' Xday_returns(data, 1)
#' Xday_returns(data, 1, log.returns = T)

Xday_returns <- function(xts, Xday = 1L, log.returns = F, start.omit = T){

  # pre
  stopifnot(require(dplyr)); stopifnot(require(xts))
  stopifnot(Xday != 0)

  Xday <- as.integer(Xday)
  nr <- dim(xts)[1]
  nc <- dim(xts)[2]

  if(log.returns) {

    returns <- diff(log(xts), lag=Xday)

  } else {

    returns <- diff(xts, Xday) / apply(xts, 2, function(x) lag(x, Xday))

  }

  if(start.omit) {

    returns <- returns[-seq(Xday), ]

  }

  attr(returns, "Xday") <- Xday

  # return
  returns

}
