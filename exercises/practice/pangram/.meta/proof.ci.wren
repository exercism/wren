class Pangram {
  static isPangram(sentence) {
    var seen = 0
    for (codePoint in sentence.codePoints) {
      codePoint = codePoint | 32
      if (codePoint >= 97 && codePoint <= 122) {
        seen = seen | (1 << (codePoint - 97))
      }
    }
    return seen == (1 << 26) - 1
  }
}
