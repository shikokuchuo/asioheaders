pkgname <- "httpgd"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('httpgd')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("hgd")
### * hgd

flush(stderr()); flush(stdout())

### Name: hgd
### Title: Asynchronous HTTP server graphics device.
### Aliases: hgd

### ** Examples

## Not run: 
##D 
##D hgd() # Initialize graphics device and start server
##D hgd_browse() # Or copy the displayed link in the browser
##D 
##D # Plot something
##D x <- seq(0, 3 * pi, by = 0.1)
##D plot(x, sin(x), type = "l")
##D 
##D dev.off() # alternatively: hgd_close()
## End(Not run)



cleanEx()
nameEx("hgd_browse")
### * hgd_browse

flush(stderr()); flush(stdout())

### Name: hgd_browse
### Title: Open httpgd URL in the browser.
### Aliases: hgd_browse

### ** Examples

## Not run: 
##D 
##D hgd()
##D hgd_browse() # open browser
##D hist(rnorm(100))
##D 
##D dev.off()
## End(Not run)



cleanEx()
nameEx("hgd_close")
### * hgd_close

flush(stderr()); flush(stdout())

### Name: hgd_close
### Title: Close httpgd device.
### Aliases: hgd_close

### ** Examples

## Not run: 
##D 
##D hgd()
##D hgd_browse() # open browser
##D hist(rnorm(100))
##D hgd_close() # Equvalent to dev.off()
##D 
##D hgd()
##D hgd()
##D hgd()
##D hgd_close(all = TRUE)
## End(Not run)



cleanEx()
nameEx("hgd_details")
### * hgd_details

flush(stderr()); flush(stdout())

### Name: hgd_details
### Title: httpgd device status.
### Aliases: hgd_details

### ** Examples

## Not run: 
##D 
##D hgd()
##D hgd_details()
##D plot(1, 1)
##D hgd_details()
##D 
##D dev.off()
## End(Not run)



cleanEx()
nameEx("hgd_generate_token")
### * hgd_generate_token

flush(stderr()); flush(stdout())

### Name: hgd_generate_token
### Title: Generate random alphanumeric token.
### Aliases: hgd_generate_token

### ** Examples

hgd_generate_token(6)



cleanEx()
nameEx("hgd_url")
### * hgd_url

flush(stderr()); flush(stdout())

### Name: hgd_url
### Title: httpgd URL.
### Aliases: hgd_url

### ** Examples

## Not run: 
##D 
##D hgd()
##D my_url <- hgd_url()
##D hgd_url(0)
##D hgd_url(plot_id(), width = 800, height = 600)
##D 
##D dev.off()
## End(Not run)



cleanEx()
nameEx("hgd_view")
### * hgd_view

flush(stderr()); flush(stdout())

### Name: hgd_view
### Title: Open httpgd URL in the IDE.
### Aliases: hgd_view

### ** Examples

## Not run: 
##D 
##D hgd()
##D hgd_view()
##D hist(rnorm(100))
##D 
##D dev.off()
## End(Not run)



cleanEx()
nameEx("hgd_watch")
### * hgd_watch

flush(stderr()); flush(stdout())

### Name: hgd_watch
### Title: Watch for changes in code files and refresh plots automatically.
### Aliases: hgd_watch

### ** Examples

## Not run: 
##D 
##D # --- my_code.R ---
##D 
##D plot(rnorm(100), col = "red")
##D 
##D # --- Other file / interactive ---
##D 
##D hgd_watch(
##D   watch = "my_code.R", # When my_code.R changes...
##D   on_change = function(...) {
##D     source("my_code.R") # ...call updated plot function.
##D   }
##D )
## End(Not run)



### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
