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
    return (resistance > ONE_KILOOHM) ?
      "%((resistance/ONE_KILOOHM).floor) kiloohms" :
      "%(resistance) ohms"
  }
  multiplier { 10.pow(colorCode_(_zeros)) }
  colorCode_(color) { COLORS.indexOf(color) }
}