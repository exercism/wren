// RailSequence uses RailIterator to implement the iterator protocol.
// https://wren.io/control-flow.html#the-iterator-protocol

class RailIterator {
  construct new(rails, count) {
    _rails = rails
    _count = count
    _rail = 0
    _delta = 1
  }

  // The number of remaining entries in the sequence.
  count { _count }

  rail { _rail }

  advance() {
    _count = _count - 1

    _rail = _rail + _delta
    if (_rail == 0 || _rail + 1 == _rails) {
      _delta = -_delta
    }
  }
}

class RailSequence {
  construct new(rails, count) {
    _rails = rails

    // The number of entries in the sequence.
    _count = count
  }

  iterate(iter) {
    if (iter == null) {
      if (_count == 0) {
        return false
      }
      return RailIterator.new(_rails, _count - 1)
    }
    if (iter.count == 0) {
      return false
    }
    iter.advance()
    return iter
  }

  iteratorValue(iter) { iter.rail }
}

class RailFenceCipher {
  static encode(msg, rails) {
    var offsets = rowOffsets(rails, msg.count)
    var result = List.filled(msg.count, 0)

    var index = 0
    for (rail in RailSequence.new(rails, msg.count)) {
      result[offsets[rail]] = msg.codePoints[index]
      offsets[rail] = offsets[rail] + 1
      index = index + 1
    }
    return (result.map {|b| String.fromCodePoint(b)}).join()
  }

  static decode(msg, rails) {
    var offsets = rowOffsets(rails, msg.count)
    var result = List.filled(msg.count, 0)

    var index = 0
    for (rail in RailSequence.new(rails, msg.count)) {
      result[index] = msg.codePoints[offsets[rail]]
      offsets[rail] = offsets[rail] + 1
      index = index + 1
    }
    return (result.map {|b| String.fromCodePoint(b)}).join()
  }

  static rowOffsets(rails, count) {
    if (rails <= 0) {
      Fiber.abort("Invalid number of rails")
    }

    var period = 2 * (rails - 1)
    var remainder = count % period
    var cycles = (count - remainder) / period
    var rowLengths = List.filled(rails, 2 * cycles)
    rowLengths[0] = cycles
    rowLengths[rails - 1] = cycles

    for (rail in RailSequence.new(rails, remainder)) {
      rowLengths[rail] = rowLengths[rail] + 1
    }

    var offsets = List.filled(rails, 0)
    var acc = 0
    for (rail in 0...rails) {
      offsets[rail] = acc
      acc = acc + rowLengths[rail]
    }
    // acc == count
    return offsets
  }
}
