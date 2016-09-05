#' Efficient Frontier
#'
#' Efficient Frontier using excess earning rate
#' @param rg numeric value, returns of goal
#' @param plot logical value, return the plot?
#' @export
#' @examples
#' xdiff_returns(sample_index, x = 1) %>% efff(rg = .01, rfr = .001)

efff <- function(returns, short = "no", max.allocation = NULL, risk.premium.up = .9, risk.increment = .0001,
                 rg = NA, plot = T, rfr = 0, rounding = NULL){

  # pre
  stopifnot(require(quadprog)); stopifnot(require(dplyr)); stopifnot(require(ggplot2))

  # content : origen code >> `eff.frontier()`
  returns <- returns - rfr
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
    if(max.allocation > 1 | max.allocation < 0){
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

  eff <- matrix(nrow = loops, ncol = n + 3)

  colnames(eff) <- c(colnames(returns), "Std_Dev", "Exp_Return", "sharpe")

  for (i in seq(from = 0, to = risk.premium.up, by = risk.increment)){
    dvec <- colMeans(returns) * i

    sol <- solve.QP(covariance, dvec = dvec, Amat = Amat, bvec = bvec, meq = meq)
    eff[loop, "Std_Dev"] <- sqrt(sum(sol$solution * colSums((covariance*sol$solution))))
    eff[loop, "Exp_Return"] <- as.numeric(sol$solution %*% colMeans(returns))
    eff[loop, "sharpe"] <- eff[loop,"Exp_Return"] / eff[loop,"Std_Dev"]
    eff[loop, 1:n] <- sol$solution
    loop <- loop + 1
  }

  # rounding

  if(is.null(rounding)){
    pool <- as.data.frame(eff)
  } else {
    pool <- as.data.frame(eff) %>% round(rounding)
  }

  # condition rg

  if(!is.na(rg)){

    res <- pool[c(which.min(abs(pool$Exp_Return - rg)), which.max(pool$sharpe)), ]
    res$Method <- c("Returns of goal Portfolio", "Optimal Portfolio")

  } else {

    res <- pool[c(which.max(pool$sharpe)), ]
    res$Method <- c("Optimal Portfolio")

  }

  # ploting

  P <- ggplot(pool, aes(x = Std_Dev, y = Exp_Return)) +
    geom_point(size = .1, alpha = .5) +
    geom_point(data = res, aes(x = Std_Dev, y = Exp_Return, color = Method), size = 2) +
    labs(title = paste0("Efficient Frontier (rfr = ", rfr, ")"), color = "")

  if(plot) return(P)

  # return
  print(P)
  attr(res, "poolset") <- pool %>% tbl_df
  return(res)

}
