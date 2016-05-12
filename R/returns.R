#' Account X day returns
#'
#' Account X day returns
#' @param xts
#' @param Xday
#' @param log.returns
#' @export
#' @examples
#' Xday_returns(xts, 365, log.returns=T)

Xday_returns <- function(xts, Xday=1, log.returns=F){

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

    for(j in seq(nc)){
      for(i in (1+Xday):nr){
        returns[i,j] <- coredata(xts[i,j])/coredata(xts[i-Xday,j])-1
      }
    }

  }

  attr(returns, "Xday") <- Xday

  returns
}

