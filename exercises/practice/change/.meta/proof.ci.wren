class Change {
  static findMinimumCoins(target, coins) {
    if (target < 0) {
      Fiber.abort("target can't be negative")
    }
    return makeChange(change(coins, target), target)
  }

  /*
   * Change making algorithm from
   * http://www.ccs.neu.edu/home/jaa/CSG713.04F/Information/Handouts/dyn_prog.pdf
   *
   * This function generates two lists, but only returns one:
   *
   * C = the minimum _number of coins_ required to make change
   *     for each n from 1 to amount.
   *
   * S = the _first_ coin used to make change for amount n.
   */
  static change(d, n) {
    var C = [0] + List.filled(n, Num.largest)
    var S = [0] + List.filled(n, null)

    var p = 1
    while (p <= n) {
      var min = Num.largest
      var coin = null
      for (c in d) {
        if (c <= p && 1 + C[p - c] < min) {
          min = 1 + C[p - c]
          coin = c
        }
      }
      C[p] = min
      S[p] = coin
      p = p + 1
    }
    return S
  }

  static makeChange(S, n) {
    if (S[n] == null) {
      Fiber.abort("can't make target with given coins")
    }
    if (n == 0) {
      return []
    }
    return [S[n]] + makeChange(S, n - S[n])
  }
}
