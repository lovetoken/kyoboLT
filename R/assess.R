assess <- function(returns.xts, ...){
  UseMethod("assess")
}

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
#' names(data) <- paste("Fund", 1:3, sep = "_")
#' returns <- Xday_returns(data, 1)
#'
#' assess.returns(returns, "mean")
#' assess.returns(returns, "sd")
#' assess.returns(returns, "S.R")

assess.returns <- function(returns.xts, method = c("mean", "sd", "S.R"), ...){

  # pre
  stopifnot(require(dplyr)); stopifnot(require(xts)); stopifnot(require(formattable))

  # content
  if(method == "mean"){

    listup <- sort(sapply(returns.xts, mean, na.rm = T), decreasing = T)
    res <- data.frame(Rank = seq(length(listup)),
                      Names = names(listup),
                      Value = as.numeric(listup) %>% percent(...))

  }

  if(method == "sd"){

    listup <- sort(sapply(returns.xts, sd, na.rm = T), decreasing = F)
    res <- data.frame(Rank = seq(length(listup)),
                      Names = names(listup),
                      Value = as.numeric(listup) %>% percent(...))

  }

  if(method == "S.R"){

    listup <- sort(
      sapply(returns.xts, mean, na.rm = T)/sapply(returns.xts, sd, na.rm = T), decreasing = T
    )
    res <- data.frame(Rank = seq(length(listup)),
                      Names = names(listup),
                      Value = as.numeric(listup) %>% percent(...))

  }

  # return
  res

}

#' Ranking assess funds using returns xts dataset
#'
#' Ranking assess funds using returns xts dataset & rank plotting
#' @param returns.xts an \code{xts} object about returns dataset
#' @param method returns mean or sd or Sharpe ratio
#' @return data.frame type about assessment result
#' @export
#' @examples
#' index <- matrix(rnorm(90,1000, 8^2), 30, 3)
#' data <- xts(round(index, 1), as.Date(16001:16030))
#' data[9:13, 3] <- NA
#' names(data) <- paste("Fund", 1:3, sep = "_")
#' returns <- Xday_returns(data, 1)

assess.rank <- function(returns.xts, choice.stock, step = F, ...){

  # pre
  stopifnot(require(dplyr)); stopifnot(require(xts)); stopifnot(require(ggplot2))

  # content
  rank_output <- apply(returns.xts, 1, function(x) rank(-x, ties.method = "max", na.last = "keep")) %>% t
  length <- apply(rank_output, 1, function(x) max(x, na.rm = T))
  pd <- as.data.frame(cbind(subset(rank_output, select = choice.stock), length))
  names(pd) <- c("rank", "max_rank")
  pd$label <- paste0(pd$rank, "/", pd$max_rank)

  tryCatch(expr={
    pd$rank <- factor(pd$rank, exclude = NULL, levels = max(pd$rank, na.rm = T):1);
    }, error = function(e) print("all NA")
  )

  # plotting
  p <- ggplot(pd, aes(x = row.names(pd), y = rank, group = NA, label = label))

  if(step){

    p + geom_step(alpha = .3, col = "blue") +
      geom_point() + theme_bw() +
      theme(axis.text.x = element_text(angle = 90)) +
      geom_text(aes(vjust = -1), size = 3, alpha = .3) +
      labs(x = "", y = "Rank")

    } else {

      p + geom_line(alpha = .3, col = "blue") +
        geom_point() + theme_bw() +
        theme(axis.text.x = element_text(angle = 90)) +
        geom_text(aes(vjust = -1), size = 3, alpha = .3) +
        labs(x = "", y = "Rank")

    }

  # res
  names(pd)[1] <- paste0(choice.stock, "_rank")
  pd

}
