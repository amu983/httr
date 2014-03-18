handle_url <- function(handle = NULL, url = NULL, ...) {
  if (!xor(is.null(url), is.null(handle))) {
    stop("Must specify exactly one of url or handle")
  }

  if (is.null(handle))  handle <- find_handle(url)
  if (is.null(url))     url <- handle$url

  # If named components in ..., modify the url
  new <- named(list(...))
  if (length(new) > 0) {
    old <- parse_url(url)
    url <- build_url(modifyList(old, new))
  }

  list(handle = handle, url = url)
}
