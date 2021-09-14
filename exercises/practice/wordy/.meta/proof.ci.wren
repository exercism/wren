// const compute = (operand1, operand2, operation) => {
//   switch (operation) {
//     case 'plus':
//       return operand1 + operand2;
//     case 'minus':
//       return operand1 - operand2;
//     case 'divided by':
//       return operand1 / operand2;
//     case 'multiplied by':
//       return operand1 * operand2;
//   }
// };

// export const answer = (question) => {
//   const operationsPattern = new RegExp(/plus|minus|divided by|multiplied by/g);
//   if (
//     !operationsPattern.test(question) &&
//     !/^What is ?-?\d*\?$/.test(question)
//   ) {
//     throw new Error('Unknown operation');
//   }

//   const generalPattern = /^What is -?\d+( (plus|minus|multiplied by|divided by) -?\d+)*\?$/g;
//   if (!generalPattern.test(question)) {
//     throw new Error('Syntax error');
//   }

//   const operations = question.match(operationsPattern);
//   const operands = question.match(/-?\d+/g);

//   let result = parseInt(operands[0]);

//   if (!operations) {
//     return result;
//   }

//   for (let i = 0; i < operations.length; i++) {
//     result = compute(result, parseInt(operands[i + 1]), operations[i]);
//   }
//   return result;
// };

var OPERATIONS = {
  "plus": Fn.new { |a,b| a + b},
  "minus": Fn.new { |a,b| a - b},
  "multiplied by": Fn.new { |a,b| a * b},
  "divided by": Fn.new { |a,b| a / b}
}

class WordLexer {
  construct new(s) {
    _s = s.replace("?"," ?")
    _cursor = 0
    _items = _s.split(" ")
  }
  isMore { _cursor < _items.count }
  peek() { peek(0) }
  peek(n) {
    if (_cursor + n >= _items.count) return null
    return _items[_cursor + n]
  }
  assert(s, err) {
    var next = read()
    if (next!=s) Fiber.abort(err)
  }
  read() {
    var item
    if (!isMore) return null

    if (peek(1) == "by") {
      item = _items[_cursor.._cursor+1].join(" ")
      _cursor = _cursor + 2
    } else {
      item = _items[_cursor]
      _cursor = _cursor + 1
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
    _lexer.assert("What", "Unknown operation")
    _lexer.assert("is", "Unknown operation")
    var acc = readNumber()
    while (_lexer.isMore && _lexer.peek() != "?") {
      var op = _lexer.read()
      // a number instead of an operator is consider a syntax error
      if (Num.fromString(op)) Fiber.abort("Syntax error")
      if (OPERATIONS[op] == null) Fiber.abort("Unknown operation")
      var num = readNumber()
      acc = OPERATIONS[op].call(acc,num)
    }
    _lexer.assert("?","Syntax error")
    return acc
  }
  readNumber() {
    var n = Num.fromString(_lexer.read())
    if (n == null) Fiber.abort("Syntax error")

    return n
  }
  static answer(question) {
    return Wordy.new(question).answer()
  }
}