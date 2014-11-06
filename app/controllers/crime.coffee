Crime =
  all: (App, date, options) ->
    new App.Models.Crime(date).toJSON(options)

module.exports = (App, server) ->

  server.get 'crime/:date', (req, res, next) ->

    Crime.all App, req.params.date,
      success: (data) ->
        res.send(data)
      error: (err) ->
        res.send(404)
    next()
