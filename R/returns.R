#' Account X day returns
#'
#' Account X day returns
#' @param xts
#' @param Xday
#' @param log.returns
#' @export
#' @examples
#' Xday_returns(xts, 365, log.returns=T)

Xday_returns <- function(xts, Xday=1L, log.returns=F){

  # ready
  stopifnot(require(dplyr))
  stopifnot(require(xts))
  stopifnot(Xday!=0)

  Xday <- as.integer(Xday)
  nr <- dim(xts)[1]
  nc <- dim(xts)[2]

  # content
  returns <- xts
  returns[] <- NA

  if(log.returns) {

    returns <- diff(log(xts), lag=Xday)

  } else {

    returns <- diff(xts, Xday)/apply(xts, 2, function(x) lag(x, Xday))

  }

  attr(returns, "Xday") <- Xday

  returns
}

