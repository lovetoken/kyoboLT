#' Assess funds using returns xts dataset
#'
#' Assess funds using returns xts dataset
#' @param returns.xts an \code{xts} object about returns dataset
#' @param method returns mean or sd or Sharpe ratio
#' @return data.frame type about assessment result
#' @export
#' @examples
#' index <- matrix(rnorm(60,1000, 8^2), 20, 3)
#' data <- xts(round(index, 1), as.Date(16001:16020)) # xts package for time series data
#' names(data) <- paste("Fund", 1:3, sep="_")
#' returns <- Xday_returns(data, 1)
#'
#' assess_returns(returns, "mean")
#' assess_returns(returns, "sd")
#' assess_returns(returns, "S.R")

assess_returns <- function(returns.xts, method=c("mean", "sd", "S.R"), ...){

  # pre
  stopifnot(require(dplyr)); stopifnot(require(xts)); stopifnot(require(formattable))

  # content
  if(method=="mean"){

    listup <- sort(sapply(returns.xts, mean, na.rm=T), decreasing = T)
    res <- data.frame(Rank=seq(length(listup)),
                      Names=names(listup),
                      mean=as.numeric(listup) %>% percent(...))

  }

  if(method=="sd"){

    listup <- sort(sapply(returns.xts, sd, na.rm=T), decreasing = F)
    res <- data.frame(Rank=seq(length(listup)),
                      Names=names(listup),
                      sd=as.numeric(listup) %>% percent(...))

  }

  if(method=="S.R"){

    listup <- sort(
      sapply(returns.xts, mean, na.rm=T)/sapply(returns.xts, sd, na.rm=T), decreasing = T
    )
    res <- data.frame(Rank=seq(length(listup)),
                      Names=names(listup),
                      S.R=as.numeric(listup) %>% percent(...))

  }

  # return
  res

}
