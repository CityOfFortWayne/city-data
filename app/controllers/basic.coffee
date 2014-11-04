Basic =
  about: (req, res, next) ->
    data = {}
    res.send(data)
    next()

module.exports = Basic
