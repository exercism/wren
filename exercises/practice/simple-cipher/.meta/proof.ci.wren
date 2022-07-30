import "random" for Random

var Alphabet = "abcdefghijklmnopqrstuvwxyz"
var Rnd = Random.new()
var RandomLetter = Fn.new { Alphabet[Rnd.int(26)] }
// return a number m such that (0 <= m and m < d)
var FloorMod = Fn.new {|n, d| (n % d + d) % d}

class SimpleCipher {
  construct new(key) {
    _key = key
  }

  static new() {
    var randomKey = (1..100).map {RandomLetter.call()}.join("")
    return new(randomKey)
  }

  key {_key}

  encode(plaintext) { encipher(plaintext) {|i, j| FloorMod.call(i + j, 26)} }
  decode(plaintext) { encipher(plaintext) {|i, j| FloorMod.call(i - j, 26)} }
  // .............................................................^

  encipher(text, cipherFn) {
    while (text.count > _key.count) {
      _key = _key + _key
    }
    var coded = []
    for (i in 0...text.count) {
      var textIdx = Alphabet.indexOf(text[i], 0)
      var keyIdx  = Alphabet.indexOf(_key[i], 0)
      var encIdx = cipherFn.call(textIdx, keyIdx)
      coded.add(Alphabet[encIdx])
    }
    return coded.join("")
  }
}
