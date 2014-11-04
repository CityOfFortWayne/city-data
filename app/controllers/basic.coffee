Basic =
  about: (App) ->
    new App.Models.City().toJSON()

module.exports = (App, server) ->

  server.get 'about', (req, res, next) ->
    res.send(Basic.about(App))
    next()

  server.get '/', (req, res, next) ->
    res.send(Basic.about(App))
    next()
