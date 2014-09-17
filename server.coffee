Restify = require 'restify'
routes = require './config/routes'

server = Restify.createServer()

routes(server)

server.listen 5000
