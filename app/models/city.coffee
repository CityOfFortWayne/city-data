class City

  toJSON: ->
    {
      "country": "US",
      "state": "IN",
      "county": "Allen",
      "founded_on": "1794-10-22",
      "incorporated_on": "1840-02-22",
      "founder": "Jean François Hamtramck",
      "named_for": "Anthony Wayne",
      "area": {
        "city": 110.83,
        "land": 110.62,
        "water": 0.21,
        "urban": 135.25,
        "metro": 1368
      },
      "population": 253691
    }

module.exports = City
