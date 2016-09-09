#' Trimming of whitespace in character
#'
#' Trimming of whitespace in character
#' @param data
#' @param method
#' @export
#' @examples
#' trim("  Wow!  ", method = "leading")
#' trim("  Wow!  ", method = "trailing")

trim <- function(data, method = "trailing"){

  ## pre
  stopifnot(is.character(data)); stopifnot(method %in% c("leading", "trailing"))

  ## content
  if(method == "leading"){

    res <- sub("^\\s+", "", data)

  } else if(method == "trailing"){

    res <- sub("\\s+$", "", data)

  }

  ## return
  res

}
