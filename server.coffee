Restify = require 'restify'
App = require './app'

server = Restify.createServer()

App.routes(server)

server.listen process.env.PORT or 5000
