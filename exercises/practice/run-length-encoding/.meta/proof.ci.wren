// export const encode = (plainText) => {
//   const consecutiveChars = /([\w\s])\1*/g;
//   return plainText.replace(consecutiveChars, (match) =>
//     match.length > 1 ? match.length + match[0] : match[0]
//   );
// };

// export const decode = (encodedText) => {
//   const countAndChar = /(\d+)(\w|\s)/g;
//   return encodedText.replace(countAndChar, (match, repeats, char) =>
//     new Array(Number(repeats) + 1).join(char)
//   );
// };

class Util {
  static isDigit(s) { "0123456789".contains(s) }
}

class Stream {
  construct new(s) {
    _cursor = 0
    _size = s.count
    _data = s
  }
  isEmpty { _cursor == _size }
  peek { isEmpty ? null : _data[_cursor] }
  read() {
    _cursor = _cursor + 1
    return _data[_cursor-1]
  }
  readNumber() {
    var out = ""
    while (Util.isDigit(peek)) out = out + read()
    return Num.fromString(out)
  }
}

class RLE {
  static encodeChar(s, count) {
    if (count==0) return ""
    if (count==1) return s
    return "%(count)%(s)"
  }
  static encode(s) {
    var out = ""
    var count = 0
    var last = ""
    for (char in s) {
      if (char != last) {
        out = out + encodeChar(last, count)
        last = char
        count = 0
      }
      count = count + 1
    }
    out = out + encodeChar(last, count)
    return out
  }
  static decode(s) {
    var stream = Stream.new(s)
    var out = ""
    while (stream.peek) {
      if (Util.isDigit(stream.peek)) {
        var num = stream.readNumber()
        out = out + stream.read() * num
      } else {
        out = out + stream.read()
      }
    }
    return out
    // Fiber.abort("Remove this statement and implement this function")
  }
}
