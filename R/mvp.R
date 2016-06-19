#' Minimum variance portfolio using returns xts dataset
#'
#' Minimum variance portfolio using returns xts dataset
#' @param returns.xts an \code{xts} object about returns dataset
#' @param precision grid precision about investment weight
#' @return data.frame type about assessment result
#' @export
#' @examples
#' index <- matrix(rnorm(60,1000, 8^2), 20, 3)
#' data <- xts(round(index, 1), as.Date(16001:16020))
#' names(data) <- paste("Fund", 1:3, sep="_")
#' returns <- Xday_returns(data, 1)
#'
#' mvp(returns)

mvp <- function(returns.xts, precision=.01, plot=T, ...){

  # pre
  stopifnot(require(dplyr)); stopifnot(require(xts)); stopifnot(require(dplyr)); stopifnot(require(ggplot2))
  stopifnot(is.xts(returns.xts)); stopifnot(is.numeric(precision))

  # content
  ## pool weight `W`
  n <- dim(returns.xts)[2]
  poolset <- seq(0, 1, by=precision) %>%
    rep(n) %>%
    matrix(length(seq(0, 1, by=precision)), n) %>%
    data.frame %>%
    expand.grid %>%
    as.matrix

  W <- poolset[rowSums(poolset)==1,] %>% t
  attr(W, "dimnames")[[1]] <- names(returns.xts)

  ## ready `mu`
  mu <- returns.xts %>% colMeans(na.rm=T)

  mu_p <- c(t(W) %*% mu)

  ## ready `sigma`
  sigma <- cov(returns.xts, use="pairwise.complete.obs")
  var_p <- diag(t(W) %*% sigma %*% W)

  pool <- cbind(t(W), Portfolio_Returns=mu_p, Volatility=var_p) %>% as.data.frame
  MVP <- pool[which.min(pool$Volatility), ]

  ## ploting
  if(plot){

    P <- ggplot(pool, aes(x = Volatility, y = Portfolio_Returns)) +
      geom_point(size = .1, alpha = .1) +
      geom_point(data = MVP, color = "blue") +
      theme_bw()
    print(P)

  }

  # return
  attr(MVP, "poolset") <- pool
  return(MVP)

}
