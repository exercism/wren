class SquareRoot {

  static squareRoot(input) {
    var candidate = 1

    if (input >= 2) {
      while ((candidate * candidate) < input) candidate = candidate + 1
    }

    return candidate
  }

}
