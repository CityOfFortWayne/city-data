Restify = require 'restify'
App = require './app'

server = Restify.createServer()

App.Routes(App, server)

server.listen process.env.PORT or 5000
