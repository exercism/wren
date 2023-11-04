class RotationalCipher {
  static rotate(text, shiftKey) {
    var rotateCodePoint = Fn.new {|codePoint|
      if ((65..90).contains(codePoint)) {
        codePoint = (codePoint - 65 + shiftKey) % 26 + 65
      } else if ((97..122).contains(codePoint)) {
        codePoint = (codePoint - 97 + shiftKey) % 26 + 97
      }
      return String.fromCodePoint(codePoint)
    }
    return text.codePoints.map(rotateCodePoint).join()
  }
}
