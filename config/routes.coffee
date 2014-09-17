API = require '../app/controllers'

module.exports = (server) ->
  server.get '/about', API.Basic.about
