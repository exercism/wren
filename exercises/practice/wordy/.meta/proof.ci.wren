var OPERATIONS = {
  "plus": Fn.new { |a,b| a + b},
  "minus": Fn.new { |a,b| a - b},
  "multiplied by": Fn.new { |a,b| a * b},
  "divided by": Fn.new { |a,b| a / b}
}

class WordLexer {
  construct new(s) {
    _cursor = 0
    _items = s.replace("?", " ?").split(" ")
  }
  isMore { _cursor < _items.count }
  peek() {
    if (!isMore) return null
    return _items[_cursor]
  }
  readOrAbort(expected, err) {
    if (read() != expected) Fiber.abort(err)
  }
  read() {
    if (!isMore) return null

    var item = _items[_cursor]
    _cursor = _cursor + 1

    if (peek() == "by") {
      item = "%(item) %(read())"
    }

    return item
  }
}

class Wordy {
  construct new(question) {
    _question = question
  }
  answer() {
    _lexer = WordLexer.new(_question)
    _lexer.readOrAbort("What", "Unknown operation")
    _lexer.readOrAbort("is", "Unknown operation")
    var acc = readNumber_()
    while (_lexer.isMore && _lexer.peek() != "?") {
      acc = nextOperation_(acc)
    }
    _lexer.readOrAbort("?","Syntax error")
    return acc
  }
  nextOperation_(acc) {
    var op = _lexer.read()
    // a number when we're expecting an operator is consider a syntax error
    if (Num.fromString(op)) Fiber.abort("Syntax error")
    if (OPERATIONS[op] == null) Fiber.abort("Unknown operation")
    var num = readNumber_()
    return OPERATIONS[op].call(acc,num)
  }
  readNumber_() {
    var n = Num.fromString(_lexer.read())
    if (n == null) Fiber.abort("Syntax error")

    return n
  }
  static answer(question) {
    return Wordy.new(question).answer()
  }
}