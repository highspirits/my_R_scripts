#source code from a URL into R environment

source_https <- function(url)
{
  library(RCurl)
  eval(parse(text=getURL(url,followlocation=T,cainfo=system.file("CurlSSL","cacert.pem",package="RCurl"))),envir=.GlobalEnv)
}
