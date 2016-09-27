#' Efficient Frontier
#'
#' Efficient Frontier using excess returns
#' @param rg numeric value, returns of goal
#' @export
#' @examples
#' returns <- xdiff_returns(sample_index, x = 1)
#' efff(returns, rg = .01, rfr = .001)

efff <- function(returns, rg = NA, rfr = 0, short = "no", max.allocation = NULL, risk.premium.up = .9,
                 risk.increment = .0001, plot.only.efff = T){

  ## pre
  stopifnot(require(quadprog)); stopifnot(require(dplyr)); stopifnot(require(ggplot2)); stopifnot(require(ggrepel))


  ## content : origen code >> `eff.frontier()`
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

    if(max.allocation > 1 | max.allocation < 0) stop("max.allocation must be greater than 0 and less than 1")
    if(max.allocation * n < 1) stop("Need to set max.allocation higher; not enough assets to add to 1")

    Amat <- cbind(Amat, -diag(n))
    bvec <- c(bvec, rep(-max.allocation, n))
  }

  loops <- risk.premium.up / risk.increment + 1
  loop <- 1

  eff <- matrix(nrow = loops, ncol = n + 3)

  colnames(eff) <- c(colnames(returns), "Std_Dev", "Excess_Return", "sharpe")

  for (i in seq(from = 0, to = risk.premium.up, by = risk.increment)){
    dvec <- colMeans(returns) * i

    sol <- solve.QP(covariance, dvec = dvec, Amat = Amat, bvec = bvec, meq = meq)
    eff[loop, "Std_Dev"] <- sqrt(sum(sol$solution * colSums(covariance*sol$solution)))
    eff[loop, "Excess_Return"] <- as.numeric(sol$solution %*% colMeans(returns))
    eff[loop, "sharpe"] <- eff[loop,"Excess_Return"] / eff[loop,"Std_Dev"]
    eff[loop, 1:n] <- sol$solution
    loop <- loop + 1
  }

  pool <- as.data.frame(eff)

  ## condition rg

  if(!is.na(rg)){

    res <- pool[c(which.min((pool$Excess_Return - rg)^2), which.max(pool$sharpe)), ]
    rownames(res) <- c("Returns of goal Portfolio", "Optimal Portfolio")

  } else {

    res <- pool[c(which.max(pool$sharpe)), ]
    rownames(res) <- c("Optimal Portfolio")

  }

  ## ploting

  if(plot.only.efff){

    P <- ggplot() +
      geom_point(data = pool, aes(x = Std_Dev, y = Excess_Return), size = .5, color = "#DAC0C0") +
      geom_point(data = res, aes(x = Std_Dev, y = Excess_Return, color = rownames(res)), size = 2)

  } else {

    pd1 <- descr(returns, c("mean", "sd")) %>% tbl_df %>%
      mutate(labels = rownames(.)) %>% rename(Excess_Return = mean, Std_Dev = sd)

    P <- ggplot() +
      geom_point(data = pool, aes(x = Std_Dev, y = Excess_Return), size = .5, color = "#DAC0C0") +
      geom_point(data = pd1, aes(x = Std_Dev, y = Excess_Return), size = 1, col = "#666666") +
      geom_text_repel(data = pd1, aes(x = Std_Dev, y = Excess_Return, label = labels), col = "#666666", size = 3) +
      geom_point(data = res, aes(x = Std_Dev, y = Excess_Return, color = rownames(res)), size = 2)

  }

  ## return
  
  print({
    P + labs(title = paste0("Efficient Frontier (rfr = ", rfr, ")"), color = "") +
      theme(plot.title = element_text(size = rel(1.4)))
  })
  attr(res, "poolset") <- pool %>% tbl_df
  return(res)

}
