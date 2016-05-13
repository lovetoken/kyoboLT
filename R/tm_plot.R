#' ts and moving average plot
#'
#' ts and moving average plot
#' @param xts
#' @param mv
#' @param plotly
#' @export
#' @examples
#' tm_plot(data, c(2,5,10))

tm_plot <- function(xts, mv=c(1, 3, 5), plotly=T){

  # ready
  stopifnot(require(dplyr))
  stopifnot(require(xts))
  stopifnot(require(ggplot2))
  stopifnot(require(plotly))
  stopifnot(is.numeric(mv))

  mv <- as.integer(mv)
  mv1 <- mv[1]
  mv2 <- mv[2]
  mv3 <- mv[3]

  # content
  PD1_1 <- xts %>%
    coredata %>%
    data.frame(Index=index(xts)) %>%
    melt(id="Index")

  PD1_2 <- xts %>%
    rollmean(k=mv1, na.pad=T, align="right") %>%
    coredata %>%
    data.frame(Index=index(xts)) %>%
    melt(id="Index", value.name="moving_average_1")

  PD1_3 <- xts %>%
    rollmean(k=mv2, na.pad=T, align="right") %>%
    coredata %>%
    data.frame(Index=index(xts)) %>%
    melt(id="Index", value.name="moving_average_2")

  PD1_4 <- xts %>%
    rollmean(k=mv3, na.pad=T, align="right") %>%
    coredata %>%
    data.frame(Index=index(xts)) %>%
    melt(id="Index", value.name="moving_average_3")

  PD1 <- left_join(PD1_1, PD1_2) %>%
    left_join(PD1_3) %>%
    left_join(PD1_4)

  P <- ggplot(PD1, aes(x=Index)) +
    geom_line(col="blue", aes(y=moving_average_3), stat="identity", alpha=.4) +
    geom_line(col="red", aes(y=moving_average_2), stat="identity", alpha=.4) +
    geom_line(col="green", aes(y=moving_average_1), stat="identity", alpha=.4) +
    geom_line(aes(y=value), stat="identity") +
    facet_grid(variable ~ .) +
    theme_bw() + ylab("") + xlab("") + ggtitle("Moving average time series plot")

  if(plotly) ggplotly(P) else P

}

