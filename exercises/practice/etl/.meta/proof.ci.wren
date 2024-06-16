class Etl {
  static toLowerUnsafe(str) {
    return str.codePoints.map(Fn.new { |cp| String.fromCodePoint(cp + 32) }).join()
  }

  static transform(legacy) {
    var results = {}
    for (pair in legacy) {
      for (letter in pair.value) {
          var lowered = toLowerUnsafe(letter)
          results[lowered] = pair.key
        }
      }

    return results
  }
}

