#' ts and moving average plot for all fund items
#'
#' ts and moving average plot for all fund items
#' @param xts
#' @param mv
#' @param plotly
#' @export
#' @examples
#' set.seed(1004)
#' index <- matrix(rnorm(3000, 1000, 5^2), 1000, 3)
#' data <- xts(round(index, 1), as.Date(16001:17000))
#' names(data) <- paste("Fund", 1:3, sep="_")
#' data
#'
#' tmplot(data)
#' tmplot(data, plotly=T)

tmplot <- function(xts, mv=c(20, 60, 120), plotly=F, ...){

  # pre
  stopifnot(require(dplyr))
  stopifnot(require(xts))
  stopifnot(require(ggplot2))
  stopifnot(require(plotly))
  stopifnot(require(reshape2))
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
    facet_grid(variable ~ ., ...) +
    theme_bw() + ylab("") + xlab("") + ggtitle("Moving average time series plot")

  # return
  if(plotly) ggplotly(P) else P

}

#' ts and moving average plot for single fund item
#'
#' ts and moving average plot for single fund item
#' @param xts
#' @param choice.stock
#' @param mv
#' @param plotly
#' @export
#' @examples
#' set.seed(1004)
#' index <- matrix(rnorm(3000, 1000, 5^2), 1000, 3)
#' data <- xts(round(index, 1), as.Date(16001:17000))
#' names(data) <- paste("Fund", 1:3, sep="_")
#' data
#'
#' tm1plot(data, "Fund1")
#' tm1plot(data, "Fund1", plotly=T)

tm1plot <- function(xts, choice.stock, mv=c(20, 60, 120), plotly=F){

  # pre
  stopifnot(require(dplyr))
  stopifnot(require(xts))
  stopifnot(require(ggplot2))
  stopifnot(require(plotly))
  stopifnot(require(reshape2))
  stopifnot(is.character(choice.stock))
  stopifnot(is.numeric(mv))

  # content
  ## subset dataset
  D <- subset(xts, select=choice.stock) %>% data.frame(date=index(.), .)

  ## melt for ggplot plotting
  PD <- melt(D, id=1)

  ## base ggplot
  P <- ggplot(PD, aes(x=date, y=value, group=variable)) +
    geom_line(size=.8, color="grey") + theme_bw() + xlab("Date") + ylab("") +
    theme(axis.text.x=element_text(angle=90))

  ## moving average line
  movD.20 <- D[-1]
  for(n in seq(nrow(D))){
    movD.20[n,] <- sapply(
      D[moving.trim(mv[1], n, end=nrow(D)),], mean, na.rm=T)[-1]
  }
  PmovD.20 <- melt(cbind(movD.20, D[1]), id=length(cbind(movD.20, D[1])))

  movD.60 <- D[-1]
  for(n in seq(nrow(D))){
    movD.60[n,] <- sapply(
      D[moving.trim(mv[2], n, end=nrow(D)),], mean, na.rm=T)[-1]
  }
  PmovD.60 <- melt(cbind(movD.60, D[1]), id=length(cbind(movD.60, D[1])))

  movD.120 <- D[-1]
  for(n in seq(nrow(D))){
    movD.120[n,] <- sapply(
      D[moving.trim(mv[3], n, end=nrow(D)),], mean, na.rm=T)[-1]
  }
  PmovD.120 <- melt(cbind(movD.120, D[1]), id=length(cbind(movD.120, D[1])))

  P <- P + geom_line(data=PmovD.20, color="purple") +
    geom_line(data=PmovD.60, color="blue") +
    geom_line(data=PmovD.120, color="red") +
    facet_grid(. ~ variable) + guides(fill=F)

  # return
  if(plotly) ggplotly(P) else P

}
