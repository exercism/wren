class Raindrops {
  static convert(n) {
    var result = ""
    if (n % 3 == 0) result = result + "Pling"
    if (n % 5 == 0) result = result + "Plang"
    if (n % 7 == 0) result = result + "Plong"
    if (result == "") return n.toString
    return result
  }
}
