class CryptoSquare {
  static columns(n) {
    var c = 0
    while (c * c < n) {
      c = c + 1
    }
    return c
  }

  static rows(n, c) {
    var r = c - 1
    if (r * c < n) {
      r = r + 1
    }
    // r * c >= n
    return r
  }

  static ciphertext(plaintext) {
    var toLower = Fn.new {|codePoint| ((65..90).contains(codePoint)) ? codePoint + 32 : codePoint }

    var isAlphanumeric = Fn.new {|codePoint| (48..57).contains(codePoint) || (65..90).contains(codePoint) || (97..122).contains(codePoint) }

    var toString = Fn.new {|codePoint| String.fromCodePoint(codePoint) }

    var codePoints = plaintext.codePoints.map(toLower).where(isAlphanumeric).toList

    var n = codePoints.count
    if (n <= 1) {
      return codePoints.map(toString).join()
    }

    var c = columns(n)
    var r = rows(n, c)
    var buffer = List.filled((r + 1) * c - 1, 32)
    var index = 0
    for (i in 0...r) {
      for (j in 0...c) {
        buffer[j * (r + 1) + i] = codePoints[index]
        index = index + 1
        if (index == n) {
          break
        }
      }
    }
    return buffer.map(toString).join()
  }
}
