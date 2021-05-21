class Strings {
    static downcase(s) {
        return s.bytes.map { |x|
            if ((65..90).contains(x)) x = x + 32
            return String.fromByte(x)
        }.join("")
    }
}

class Dup {
  static map(src) {
    __n = {}
    for (k in src.keys) {
      __n[k] = src[k]
    }
    return __n
  }
}

class Lexer {
  construct new(s) {
    _tokens = s.split(" ")
    _i = 0
  }
  isMore {_i < _tokens.count }
  peek { _tokens[_i] }
  read {
    _i = _i + 1
    return _tokens[_i - 1]
  }
  next() { _i = _i + 1 }
  readPast(s) {
    var list = []
    while (peek!=s && isMore) { list.add(read) }
    if (peek == s) {
      next()
      return list
    }
    return null
  }
}

class Forth {
  static new() { Forth.new(Forth.builtins(), []) }
  construct new(commands, stack) {
    _commands = commands || Forth.builtins()
    _stack = stack || []
  }
  static builtins() {
    return {
      "+": { "arity": 2, "fn": Fn.new { |a, b| [a + b] } },
      "-": { "arity": 2, "fn": Fn.new { |b, a| [a - b] } },
      "*": { "arity": 2, "fn": Fn.new { |a, b| [a * b] } },
      "/": {
        "arity": 2,
        "fn": Fn.new { |b, a|
          if (b == 0) {
            Fiber.abort("Division by zero")
          }

          return [(a / b).floor]
        }
      },
      "dup": { "arity": 1, "fn": Fn.new { |a| [a, a] } },
      "drop": { "arity": 1, "fn": Fn.new { [] } },
      "swap": { "arity": 2, "fn": Fn.new { |b,a| [b, a]  }},
      "over": { "arity": 2, "fn": Fn.new { |b,a| [a, b, a] } },
    }
  }
  isNumber(n) { Num.fromString(n) != null }
  execCommand(name) {
    var result = null
    var func = _commands[name]
    if (func == null) Fiber.abort("unknown function: %(name)")

    if (func["arity"]==1) {
      result = func["fn"].call(pop())
    } else if (func["arity"] ==2) {
      result = func["fn"].call(pop(), pop())
    } else {
      result = func["fn"].call() // user defined command
    }
    _stack.addAll(result)
  }
  addCommand(name, pgm) {
    _closure_commands = Dup.map(_commands)
    _commands[name] = {
      "fn": Fn.new {
        var vm = Forth.new(_closure_commands, _stack)
        vm.evaluate(pgm.join(" "))
        return []
      }
    }
  }
  hasCommand(x) { _commands[x] != null }
  defineCommand() {
    var name = Strings.downcase(_lexer.peek)
    if (isNumber(name)) Fiber.abort("Invalid definition")
    _lexer.next()

    var subroutine = _lexer.readPast(";")
    if (subroutine == null) {
      // TODO: coulld not find end of command
    } else {
      addCommand(name, subroutine)
    }
  }
  stack { _stack }
  pop() {
    if (_stack.isEmpty) Fiber.abort("Stack empty")
    return _stack.removeAt(-1)
  }
  push(i) { stack.add(i) }
  evaluate(s) {
    _lexer = Lexer.new(s)
    while (_lexer.isMore) {
      var item = Strings.downcase(_lexer.read)
      if (isNumber(item)) {
        push(Num.fromString(item))
      } else if (item == ":") {
        defineCommand()
      } else if (hasCommand(item)) {
        execCommand(item)
      } else {
        Fiber.abort("Unknown command")
      }
    }
  }
}
