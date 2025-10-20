class Dominoes {
  static canChain(dominoes) {
    var n = 0
    for (stone in dominoes) {
      n = n.max(stone[0])
      n = n.max(stone[1])
    }
    n = n + 1
    var tally = List.filled(n, 0)
    var parents = (0...n).toList
    for (stone in dominoes) {
      var first = stone[0]
      var second = stone[1]
      tally[first] = tally[first] + 1
      tally[second] = tally[second] + 1
      first = root(parents, first)
      second = root(parents, second)
      parents[second] = first
    }
    var roots = 0
    for (i in 0...n) {
      if (tally[i] % 2 == 1) {
        return false
      }
      if (tally[i] > 0 && parents[i] == i) {
        roots = roots + 1
      }
    }
    return (roots <= 1)
  }

  static root(parents, current) {
    var parent = parents[current]
    while (current != parent) {
      var grandparent = parents[parent]
      parents[current] = grandparent
      current = parent
      parent = grandparent
    }
    return current
  }
}
