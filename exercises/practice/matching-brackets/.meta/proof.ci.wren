var BRACKETS = "{}[]()"
var PAIRS = {
  "{": "}",
  "(": ")",
  "[": "]"
}
var OPEN_BRACKETS = PAIRS.keys

class Brackets {
  static mismatchedBracket(open, char) { PAIRS[open] != char }
  static isPaired(s) {
    var stack = []
    for (char in s) {
      if (!BRACKETS.contains(char)) continue
      if (OPEN_BRACKETS.contains(char)) {
        stack.add(char)
      } else {
        if (stack.isEmpty) return false

        var openedBracket = stack[-1]
        if (mismatchedBracket(openedBracket,char)) return false
        // stack.pop
        stack = stack[0...-1]
      }
    }
    return stack.isEmpty
  }
}