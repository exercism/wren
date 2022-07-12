class SquareRoot {

  static squareRoot(n) {
    var candidate = 1

    if (n >= 2) {
      while ((candidate * candidate) < n) candidate = candidate + 1
    }

    return candidate
  }

}
