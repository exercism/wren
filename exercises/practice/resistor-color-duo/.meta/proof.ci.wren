// resistor-color solution START
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
  "white"
]

class Resistor {
  static colorCode(color) { COLORS.indexOf(color) }
}
// resistor-color solution END

class ResistorDuo {
  static decodedValue(colors) {
    var tens = colors[0]
    var ones = colors[1]
    return Resistor.colorCode(tens) * 10 + Resistor.colorCode(ones)
  }
}
