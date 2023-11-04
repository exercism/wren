class BottleSong {
  static toTitleCase(description) {
    var first = String.fromCodePoint(description.codePoints[0] - 32)
    var rest = description[1..-1]
    return first + rest
  }

  static describe(numBottles) {
    var names = [
      "no",
      "one",
      "two",
      "three",
      "four",
      "five",
      "six",
      "seven",
      "eight",
      "nine",
      "ten"
    ]
    var suffix = "s"
    if (numBottles == 1) {
      suffix = ""
    }
    return "%(names[numBottles]) green bottle%(suffix)"
  }

  static recite(startBottles, takeDown) {
    var result = []
    var currentBottles = startBottles
    for (i in 0...takeDown) {
      var description = toTitleCase(describe(currentBottles))
      result.add("%(description) hanging on the wall,")
      result.add("%(description) hanging on the wall,")
      result.add("And if one green bottle should accidentally fall,")
      currentBottles = currentBottles - 1
      description = describe(currentBottles)
      result.add("There'll be %(description) hanging on the wall.")
      if (i + 1 < takeDown) {
        result.add("")
      }
    }
    return result
  }
}
