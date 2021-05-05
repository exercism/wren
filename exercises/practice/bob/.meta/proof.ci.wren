class Strings {
  static upcase(s) {
    return s.bytes.map { |x|
      if ((97..122).contains(x)) x = x - 32
      return String.fromByte(x)
    }.join("")
  }
  static hasUppercaseLetters(m) {
    for (c in m.bytes) {
      if ((65..90).contains(c)) return true
    }
    return false
  }
}

class Bob {
  static isSilence(m) { m.trim() == "" }
  static isAQuestion(m) { m.trim()[-1] == "?" }
  static isShouting(m) { Strings.hasUppercaseLetters(m) && m == Strings.upcase(m) }
  static hey(message) {
    if (isSilence(message)) {
      return "Fine. Be that way!"
    }
    if (isShouting(message)) {
      if (isAQuestion(message)) {
        return "Calm down, I know what I'm doing!"
      } else {
        return "Whoa, chill out!"
      }
    }
    if (isAQuestion(message)) {
      return "Sure."
    }
    return "Whatever."
  }
}
