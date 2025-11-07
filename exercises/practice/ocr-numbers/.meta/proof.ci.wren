var TEMPLATES = [
  [
    " _ ", //
    "| |", // 0
    "|_|", //
    "   ", //
  ],
  [
    "   ", //
    "  |", // 1
    "  |", //
    "   ", //
  ],
  [
    " _ ", //
    " _|", // 2
    "|_ ", //
    "   ", //
  ],
  [
    " _ ", //
    " _|", // 3
    " _|", //
    "   ", //
  ],
  [
    "   ", //
    "|_|", // 4
    "  |", //
    "   ", //
  ],
  [
    " _ ", //
    "|_ ", // 5
    " _|", //
    "   ", //
  ],
  [
    " _ ", //
    "|_ ", // 6
    "|_|", //
    "   ", //
  ],
  [
    " _ ", //
    "  |", // 7
    "  |", //
    "   ", //
  ],
  [
    " _ ", //
    "|_|", // 8
    "|_|", //
    "   ", //
  ],
  [
    " _ ", //
    "|_|", // 9
    " _|", //
    "   ", //
  ],
]

class OcrNumbers {
  static convert(rows) {
    if (rows.count == 0) {
      return 0
    }
    if (rows.count % 4 != 0) {
      Fiber.abort("Number of input lines is not a multiple of four")
    }
    if (rows[0].count % 3 != 0) {
      Fiber.abort("Number of input columns is not a multiple of three")
    }
    var result = ""
    for (i in 0 ... (rows.count / 4)) {
      for (j in 0 ... (rows[0].count / 3)) {
        var range = (3 * j) ... (3 * j + 3)
        var digit = "?"
        for (candidate in 0..9) {
          var template = TEMPLATES[candidate]
          if (template[0] == rows[4 * i + 0][range] &&
              template[1] == rows[4 * i + 1][range] &&
              template[2] == rows[4 * i + 2][range] &&
              template[3] == rows[4 * i + 3][range]) {
            digit = candidate.toString
            break
          }
        }
        result = result + digit
      }
      result = result + ","
    }
    return result[0 ... -1]
  }
}
