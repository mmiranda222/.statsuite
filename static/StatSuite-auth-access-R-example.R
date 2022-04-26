library(httr)
library(XML)
 
Oauth_console <- 'Z:\\OauthToken\\Bin\\OauthToken.exe'
keycloak_url  <- 'https://AUTH-SERVICE-ROOT/auth/realms/YOURORG'
test_url      <- 'https://SDMX-SERVICE-ROOT/rest/dataflow/all/all/all' # To get all dataflow
app_id        <- ' yourappid'
 
# Start OauthToken.exe console, it opens a browser, user authenticates
# ---------------------------------------------------------------------------
out <- ''
out <- shell(paste0(Oauth_console, " ", keycloak_url, app_id), intern = TRUE, wait=TRUE)
o   <- as.list(out)
 
access_token  <- trimws(substr(o[[20]],nchar('accessToken:')+1,nchar(o[[20]])))
refresh_token <- trimws(substr(o[[23]],nchar('refreshToken:')+1,nchar(o[[23]])))
 
# Refresh the token
# ---------------------------------------------------------------------------
Sys.unsetenv("no_proxy") 
Sys.setenv(no_proxy='')
res <- httr::POST(paste0(keycloak_url,'/protocol/openid-connect/token'),
                  httr::add_headers(.headers = c("Content-Type" = "application/x-www-form-urlencoded")),
                  body   = paste0('grant_type=refresh_token&client_id=app&refresh_token=',refresh_token),
                  encode = "multipart")
 
if (res$status_code==200) {
  json_res <- httr::content(res, type = "text", encoding = "UTF-8")  
  cat('\nToken has been refreshed')
  result <- jsonlite::fromJSON(json_res)
  new_access_token  <- result$access_token
  new_refresh_token <- result$refresh_token
} else {
  stop('An error has occured when refreshing token')
}
 
# Test NSI REST URL (Get all dataflows) using token
# ---------------------------------------------------------------------------
config <- c(httr::add_headers("Authorization"=paste0('Bearer ',new_access_token)))
config <- c(config, httr::accept('application/xml;'))
Sys.unsetenv("no_proxy") 
Sys.setenv(no_proxy="*")
msg <- httr::GET(test_url, as.list(config))
if (res$status_code==200) {
  xml_doc <- xmlParse(msg)
  nsDefs <- xmlNamespaceDefinitions(xml_doc)
  xml_ns <- structure(sapply(nsDefs, function(x) x$uri), names = names(nsDefs))
  
  df_ids <- xpathSApply(doc = xml_doc,
                        path       = '//message:Structure//message:Structures//structure:Dataflows//structure:Dataflow',
                        namespaces = xml_ns,
                        xmlGetAttr,
                        'id')
  cat(paste0('\n', length(df_ids), ' dataflows'))
} else {
  stop('An error has occured when getting dataflows')
}
 
