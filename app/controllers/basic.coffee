Basic =
  about: (req, res, next) ->
    data =
      name: "Fort Wayne"
    res.send(data)
    next()

module.exports = Basic
