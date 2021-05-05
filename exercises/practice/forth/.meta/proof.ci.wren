// export class Forth {
//   constructor(stack = [], commands = Forth.basicCommands()) {
//     this.stack = stack;
//     this.commands = commands;
//   }

//   evaluate(program) {
//     const words = program.toLowerCase().split(' ');

//     for (let t = 0; t < words.length; t++) {
//       const word = words[t];

//       // numbers
//       if (/^-?\d+$/.test(word)) {
//         this.stack.push(Number(word));

//         // word definition
//       } else if (word === ':') {
//         const semicolon = words.indexOf(';', t);

//         if (semicolon === -1) {
//           throw new Error('Unterminated definition');
//         }

//         this.defineCommand(
//           words[t + 1],
//           words.slice(t + 2, semicolon).join(' ')
//         );

//         t = semicolon;

//         // commands
//       } else {
//         const command = this.commands[word];

//         if (!command) {
//           throw new Error('Unknown command');
//         }

//         this.performCommand(command);
//       }
//     }
//   }

//   defineCommand(word, subprogram) {
//     if (Forth.isKeyword(word)) {
//       throw new Error('Invalid definition');
//     }

//     let execute;

//     // Evaluate subprogram immediately if possible, otherwise evaluate later
//     try {
//       const stackSize = this.stack.length;
//       this.evaluate(subprogram);
//       const result = this.stack.splice(stackSize);
//       execute = () => result;
//     } catch {
//       execute = this.evaluate.bind(this, subprogram);
//     }

//     this.commands[word] = {
//       arity: 0, // handled inside the call
//       execute,
//     };
//   }

//   performCommand(command) {
//     if (command.arity > this.stack.length) {
//       throw new Error('Stack empty');
//     }

//     const args = this.stack.splice(this.stack.length - command.arity);
//     const vals = command.execute.apply(this, args);
//     this.stack.push.apply(this.stack, vals);
//   }

//   static isKeyword(word) {
//     return word === ':' || word === ';' || /^-?\d+$/.test(word);
//   }

//   static basicCommands() {
//     return {
//       '+': { arity: 2, execute: (a, b) => [a + b] },
//       '-': { arity: 2, execute: (a, b) => [a - b] },
//       '*': { arity: 2, execute: (a, b) => [a * b] },
//       '/': {
//         arity: 2,
//         execute: (a, b) => {
//           if (b === 0) {
//             throw new Error('Division by zero');
//           }

//           return [Math.floor(a / b)];
//         },
//       },
//       dup: { arity: 1, execute: (a) => [a, a] },
//       drop: { arity: 1, execute: () => {} },
//       swap: { arity: 2, execute: (a, b) => [b, a] },
//       over: { arity: 2, execute: (a, b) => [a, b, a] },
//     };
//   }
// }

class Strings {
    static downcase(s) {
        return s.bytes.map { |x|
            if ((65..90).contains(x)) x = x + 32
            return String.fromByte(x)
        }.join("")
    }
}

class Util {
  static mapDup(src) {
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
  pop() {
    if (_stack.isEmpty) Fiber.abort("Stack empty")
    return _stack.removeAt(-1)
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
    // System.print("adding %(name): %(pgm)")
    _closure_commands = Util.mapDup(_commands)
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
      // couldl not find end of command
    } else {
      addCommand(name, subroutine)
    }


    // while (true) {
    //   _lexer.next()
    //   var nextItem = Strings.downcase(_lexer.peek)
    //   if (nextItem == ";") {
    //     addCommand(_name, _list)
    //     break
    //   } else {
    //     _list.add(nextItem)
    //   }
    // }
  }
  push(i) { stack.add(i) }
  evaluate(s) {
    _lexer = Lexer.new(s)
    while (_lexer.isMore) {
      var item = Strings.downcase(_lexer.peek)
      if (isNumber(item)) {
        push(Num.fromString(item))
      } else if (item == ":") {
        _lexer.next()
        defineCommand()
      } else if (hasCommand(item)) {
        // System.print("calling %(item)")
        execCommand(item)
      } else {
        Fiber.abort("Unknown command")
      }
      _lexer.next()
    }
  }

  stack { _stack }
}
