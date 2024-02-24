// ------------------------------------------------------------------
class Frequency {
  static ofText(text) {
    return text.codePoints.reduce(Frequency.new()) {|freq, cp|
      var char
      if (65 <= cp && cp <= 90) char = String.fromCodePoint(cp + 32)
      if (97 <= cp && cp <= 122) char = String.fromCodePoint(cp)
      if (char != null) freq.incr(char)
      return freq
    }
  }

  construct new() {
    _map = {}
  }

  keys { _map.keys }
  [key] { _map[key] }
  [key]=(value) { _map[key] = value }

  toMap { _map }
  toString { _map.toString }

  incr(key) { incr(key, 1) }
  incr(key, amount) { _map[key] = (_map.containsKey(key) ? _map[key] : 0) + amount }

  addAll(other) {
    if (other is Frequency) {
      other.keys.each {|key|
        incr(key, other[key])
      }
    }
  }
}

// ------------------------------------------------------------------
class ParallelLetterFrequency {
  construct new(inputs) {
    _texts = inputs
  }

  nonConcurrent() {
    return _texts.reduce(Frequency.new()) {|freq, text|
      freq.addAll(Frequency.ofText(text))
      return freq
    }.toMap
  }

  concurrent() {
    // create a fiber for each input text
    var fibers = _texts.map {|text|
      return Fiber.new {|str|
        Fiber.yield()   // so the first `call` doesn't wait for the result
        var freq = Frequency.ofText(str)
        Fiber.yield(freq)
      }
    }.toList

    // then send a piece of text to each fiber
    (0..._texts.count).each {|i|
      fibers[i].call(_texts[i])
    }

    // then collect the results
    var result = Frequency.new()
    fibers.each {|fiber|
      var freq = fiber.call()
      result.addAll(freq)
    }

    return result.toMap
  }

  calculateFrequencies() {
    //return nonConcurrent()
    return concurrent()
  }
}
