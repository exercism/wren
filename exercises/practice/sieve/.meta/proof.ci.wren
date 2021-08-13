class Sieve {
  construct new(limit) {
    _limit = limit
  }

  primes {
    if (_limit < 2) return []

    var flag = List.filled(_limit+1, true)

    (2.._limit).each {|p|
      if (flag[p]) {
        var i = p * p
        while (i <= _limit) {
          flag[i] = false
          i = i + p
        }
      }
    }

    return (2.._limit).where {|i| flag[i]}.toList
  }
}
