#' Efficient Frontier
#'
#' Efficient Frontier
#' @export
#' @examples
#' set.seed(777)
#' index <- matrix(rnorm(60,1000, 8^2), 20, 3)
#' data <- xts(round(index, 1), as.Date(16001:16020))
#' names(data) <- paste("Fund", 1:3, sep="_")
#' returns <- Xday_returns(data, 1)
#'
#' result <- efff(returns, rg = 0.012)

efff <- function(returns, short = "no", max.allocation = NULL, risk.premium.up = .9, risk.increment = .0001,
                 rg = NA, plot = T){

  # pre
  stopifnot(require(quadprog)); stopifnot(require(dplyr)); stopifnot(require(ggplot2))

  # content : origen code >> `eff.frontier()`
  covariance <- cov(returns)
  n <- ncol(covariance)

  Amat <- matrix(1, nrow = n)
  bvec <- 1
  meq <- 1

  if(short == "no"){
    Amat <- cbind(1, diag(n))
    bvec <- c(bvec, rep(0, n))
  }

  if(!is.null(max.allocation)){
    if(max.allocation > 1 | max.allocation <0){
      stop("max.allocation must be greater than 0 and less than 1")
    }
    if(max.allocation * n < 1){
      stop("Need to set max.allocation higher; not enough assets to add to 1")
    }
    Amat <- cbind(Amat, -diag(n))
    bvec <- c(bvec, rep(-max.allocation, n))
  }

  loops <- risk.premium.up / risk.increment + 1
  loop <- 1

  eff <- matrix(nrow=loops, ncol=n+3)

  colnames(eff) <- c(colnames(returns), "Std.Dev", "Exp.Return", "sharpe")

  for (i in seq(from = 0, to = risk.premium.up, by = risk.increment)){
    dvec <- colMeans(returns) * i

    sol <- solve.QP(covariance, dvec = dvec, Amat = Amat, bvec = bvec, meq = meq)
    eff[loop, "Std.Dev"] <- sqrt(sum(sol$solution*colSums((covariance*sol$solution))))
    eff[loop, "Exp.Return"] <- as.numeric(sol$solution %*% colMeans(returns))
    eff[loop, "sharpe"] <- eff[loop,"Exp.Return"] / eff[loop,"Std.Dev"]
    eff[loop, 1:n] <- sol$solution
    loop <- loop+1
  }

  pool <- as.data.frame(eff)

  # condition rg

  if(!is.na(rg)){

    res <- pool[c(which.min(abs(pool$Exp.Return - rg)), which.max(pool$sharpe)), ]
    res$Method <- c("Returns of goal Portfolio", "Market Portfolio")
    res$Point_color <- c("green", "red")

  } else {

    res <- pool[which.max(pool$sharpe), ]
    res$Method <- c("Market Portfolio")
    res$Point_color <- c("red")

  }

  # ploting

  if(plot){

    P <- ggplot(pool, aes(x = Std.Dev, y = Exp.Return)) +
      geom_point(size = .1, alpha = .01) +
      geom_point(data = res[res$Method == "Returns of goal Portfolio", ], size = 2, color = "green") +
      geom_point(data = res[res$Method == "Market Portfolio", ], size = 2, color = "red") +
      theme_bw() + labs(title = "Efficient Frontier")

    print(P)

  }

  # return
  attr(res, "poolset") <- pool %>% tbl_df
  return(res)

}
