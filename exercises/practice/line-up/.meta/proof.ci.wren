class LineUp {
  static format(name, number) {
    return name + ", you are the " + number.toString + suffix(number) + " customer we serve today. Thank you!"
  }

  static suffix(number) {
    var units = number % 10
    var tens = (number - units) / 10 % 10
    if (tens == 1) {
      return "th"
    }
    if (units == 1) {
      return "st"
    }
    if (units == 2) {
      return "nd"
    }
    if (units == 3) {
      return "rd"
    }
    return "th"
  }
}
