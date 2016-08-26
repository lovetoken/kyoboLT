#' Accounting x diff returns
#'
#' 날짜와 구분없이 x 시차 값을 기준으로 수익률을 계산합니다.
#' @param xts an \code{xts} object
#' @param x an integer value
#' @param log.returns logical asking whether to calculate log returns
#' @return xts type about returns dataset
#' @export
#' @examples
#' xdiff_returns(sample_index, 1)
#' xdiff_returns(sample_index, 1, log.returns = T)

xdiff_returns <- function(xts, x = 1L, log.returns = F, start.omit = T){

  # pre
  stopifnot(require(dplyr)); stopifnot(require(xts))
  stopifnot(x != 0)

  x <- as.integer(x)
  nr <- dim(xts)[1]
  nc <- dim(xts)[2]

  if(log.returns) {

    returns <- diff(log(xts), lag = x)

  } else {

    returns <- diff(xts, x) / apply(xts, 2, function(a) lag(a, x))

  }

  if(start.omit) {

    returns <- returns[-seq(x), ]

  }

  attr(returns, "x") <- x

  # return
  returns

}
