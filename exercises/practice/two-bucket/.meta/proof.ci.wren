var TwoBucketError = "Impossible to measure"

class Math {
  static gcd(a,b) {
    return (b == 0) ? a : gcd(b, a % b)
  }
}


class TwoBucket {
  static measure(info) { this.new(info).solve() }

  construct new(info) {
    _goal = info["goal"]
    _first = Bucket.new("one", info["bucketOne"])
    _second = Bucket.new("two", info["bucketTwo"])

    if (info["startBucket"] != "one") {
      var tmp = _second
      _second = _first
      _first = tmp
    }

    if (_goal > _first.size.max(_second.size)) Fiber.abort(TwoBucketError)
    var gcd = Math.gcd(_first.size, _second.size)
    if (gcd > 1 && _goal % gcd != 0) Fiber.abort(TwoBucketError)
  }

  solve() {
    _first.empty()
    _second.empty()
    var moves = 0

    _first.fill()
    moves = moves + 1

    if (_goal == _second.size) {
      _second.fill()
      moves = moves + 1
    }

    while (true) {
      if (_goal == _first.amount) {
        return resultData(moves, _first, _second)
      }
      if (_goal == _second.amount) {
        return resultData(moves, _second, _first)
      }

      if (_first.isEmpty) {
        _first.fill()
      } else if (_second.isFull) {
        _second.empty()
      } else {
        _first.pourInto(_second)
      }
      moves = moves + 1
    }
  }

  resultData(moves, b1, b2) {
    return {"moves": moves, "goalBucket": b1.name, "otherBucket": b2.amount}
  }
}

class Bucket {
  construct new(name, size) {
    _name = name
    _size = size
    _amount = 0
  }

  name     { _name }
  size     { _size }
  amount   { _amount }
  available { _size - _amount }

  isFull   { _amount == _size }
  isEmpty  { _amount == 0 }

  fill()  {
    _amount = _size
  }
  empty() {
    _amount = 0
  }
  add(amount) {
    _amount = _amount + amount
  }
  pourInto(other) {
    var amount = _amount.min(other.available)
    other.add(amount)
    _amount = _amount - amount
  }

  toString { "%(this.type)(%(name): %(amount)/%(size))" }
}
