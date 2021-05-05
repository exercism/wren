class Strings {
  static downcase(s) {
    return s.bytes.map { |x|
      if ((65..90).contains(x)) x = x + 32
      return String.fromByte(x)
    }.join("")
  }
}

var LETTER_SCORES = {
  "a": 1,
  "e": 1,
  "i": 1,
  "o": 1,
  "u": 1,
  "l": 1,
  "n": 1,
  "r": 1,
  "s": 1,
  "t": 1,
  "d": 2,
  "g": 2,
  "b": 3,
  "c": 3,
  "m": 3,
  "p": 3,
  "f": 4,
  "h": 4,
  "v": 4,
  "w": 4,
  "y": 4,
  "k": 5,
  "j": 8,
  "x": 8,
  "q": 10,
  "z": 10,
}

class Scrabble {
  static score(word) { Scrabble.new(word).score }
  construct new(word) { _word = Strings.downcase(word) }

  letterScore(letter) { LETTER_SCORES[letter] || 0 }
  score { _word.reduce(0) { |acc, char | acc + letterScore(char) } }
}