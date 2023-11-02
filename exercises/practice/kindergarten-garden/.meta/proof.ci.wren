class KindergartenGarden {
  static plants(diagram, student) {
    var first = 2 * (student.codePoints[0] - 65)
    var second = first + 1
    var third = (diagram.codePoints.count + 1) / 2 + first
    var fourth = third + 1
    return [
      plant(diagram.codePoints[first]),
      plant(diagram.codePoints[second]),
      plant(diagram.codePoints[third]),
      plant(diagram.codePoints[fourth])
    ]
  }

  static plant(letter) {
    if (letter == 71) {
      return "grass"
    }
    if (letter == 67) {
      return "clover"
    }
    if (letter == 82) {
      return "radishes"
    }
    if (letter == 86) {
      return "violets"
    }
  }
}
