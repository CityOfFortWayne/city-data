fs = require('fs')
path = require('path')

class Crime

  constructor: (date) ->
    @date = date

  toJSON: (options) ->
    filePath = path.join(__dirname, "fixtures/crime/#{@date}.json")

    fs.readFile filePath, "utf8", (err, data) ->
      if err
        options.error(err) if options.error?
        return

      options.success(JSON.parse(data))

module.exports = Crime
