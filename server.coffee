Restify = require 'restify'
App = require './app'

server = Restify.createServer()

App.Routes(App, server)

# Serve static files from public directory
server.get /.*/, Restify.serveStatic
  directory: './public'
  default: 'index.html'

server.listen process.env.PORT or 5000
