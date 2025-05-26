class Matrix {
  static row(string, index) {
    return string.split("\n")[index - 1].split(" ").map {|value| Num.fromString(value) }.toList
  }
  static column(string, index) {
    return string.split("\n").map {|value| Num.fromString(value.split(" ")[index - 1]) }.toList
  }
}
