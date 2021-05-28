class Strings {
  static downcase(s) {
    return s.bytes.map { |x|
      if ((65..90).contains(x)) x = x + 32
      return String.fromByte(x)
    }.join("")
  }
}

class Anagram {
  static sameWord(word, word2) { Strings.downcase(word) == Strings.downcase(word2) }
  static normalize(word) {
    return Strings.
      downcase(word).
      bytes.
      toList.
      sort().
      map { |x| String.fromByte(x) }.join("")
  }
  static isAnagram(word, word2) {
    if (sameWord(word, word2)) return false

    return normalize(word) == normalize(word2)
  }
  static find(word, list) { list.where { |item| isAnagram(word, item) }.toList }
}