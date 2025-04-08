pkgname <- "websocket"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
library('websocket')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("WebSocket")
### * WebSocket

flush(stderr()); flush(stdout())

### Name: WebSocket
### Title: Create a WebSocket client
### Aliases: WebSocket

### ** Examples

## Only run this example in interactive R sessions
if (interactive()) {

# Create a websocket using the websocket.org test server
ws <- WebSocket$new("ws://echo.websocket.org/")
ws$onMessage(function(event) {
  cat("Client got msg:", event$data, "\n")
})
ws$onClose(function(event) {
  cat("Client disconnected\n")
})
ws$onOpen(function(event) {
  cat("Client connected\n")
})

# Try sending a message with ws$send("hello").
# Close the websocket with ws$close() after you're done with it.
}



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
