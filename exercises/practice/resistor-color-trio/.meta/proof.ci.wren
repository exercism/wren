var COLORS = [
  "black",
  "brown",
  "red",
  "orange",
  "yellow",
  "green",
  "blue",
  "violet",
  "grey",
  "white",
]

var ONE_KILOOHM = 1000

class ResistorColorTrio {
  construct new(colors) {
    _colors = colors[0..2]
    _tens = colors[0]
    _ones = colors[1]
    _zeros = colors[2]
  }
  label { "Resistor value: %(this)" }
  isValid { _colors.all {|x| colorCode_(x) != -1 } }
  resistance {
    if (!isValid) Fiber.abort("invalid color")

    return (colorCode_(_tens)*10 + colorCode_(_ones)) * multiplier
  }
  toString {
    var value = resistance
    var prefix = ["", "kilo", "mega", "giga"]
    var idx = 0
    while (value > 0 && value % 1000 == 0) {
      value = value / 1000
      idx = idx + 1
    }
    return "%(value) %(prefix[idx])ohms"
  }
  multiplier { 10.pow(colorCode_(_zeros)) }
  colorCode_(color) { COLORS.indexOf(color) }
}
