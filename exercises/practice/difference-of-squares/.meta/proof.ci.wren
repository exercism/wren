class Squares {
  static squareOfSum(n) {
    var sum = 0
    var x = 0

    while (x < n) {
      x = x + 1
      sum = sum + x
    }
    
    return sum * sum
  }

  static sumOfSquares(n) {
    var squares = 0
    var x = 0

    while (x < n) {
      x = x + 1
      squares = squares + (x * x)
    }

    return squares
  }
  
  static differenceOfSquares(n) {
    return squareOfSum(n) - sumOfSquares(n)
  }

}
