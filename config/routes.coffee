Controllers = require '../app/controllers'

module.exports = (App, server) ->
  Controllers.Basic(App, server)
  Controllers.Crime(App, server)
