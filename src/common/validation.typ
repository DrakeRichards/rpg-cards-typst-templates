// Check if a given path is a URL or a file path
#let isUrl(string) = {
  let urlPattern = regex("^(http|https):\/\/")
  let matches = string.match(urlPattern)
  if matches == none {
    return false
  }
  return true
}
