#' Account X day returns
#'
#' Account X day returns
#' @param data
#' @param X
#' @param start.column
#' @export
#' @examples
#' Xday_returns(data, 365, start.column=7)

Xday_returns <- function(data, X, start.column=7){
  nrow <- dim(data)[1]
  ncol <- dim(data)[2]

  returns.dataset <- data
  returns.dataset[start.column:ncol] <- NA

  for(j in start.column:ncol){
    for(i in (1+X):nrow){
      returns.dataset[i,j] <- data[i,j]/data[i-X,j]-1
    }
  }

  colnames(returns.dataset)[start.column:ncol] <- paste(colnames(data)[start.column:ncol],
                                                        "_", X, "DayReturns", sep="")
  returns.dataset
}
