var TwoBucketError = "Impossible to measure"

class TwoBucket {
  static measure(info) {this.new(info).solve()}

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
    var gcd = gcd(_first.size, _second.size)
    if (gcd > 1 && _goal % gcd != 0) Fiber.abort(TwoBucketError)
  }

  gcd(a, b) { (b == 0) ? a : gcd(b, a % b) }

  solve() {
    _first.empty()
    _second.empty()
    var steps = 0

    _first.fill()
    steps = steps + 1

    if (_goal == _second.size) {
      _second.fill()
      steps = steps + 1
    }

    while (1) {
      if (_goal == _first.amount) {
        return resultData(steps, _first, _second)
      }
      if (_goal == _second.amount) {
        return resultData(steps, _second, _first)
      }

      if (_first.isEmpty) {
        _first.fill()
      } else if (_second.isFull) {
        _second.empty()
      } else {
        _first.pourInto(_second)
      }
      steps = steps + 1
    }
  }

  resultData(steps, b1, b2) {
    return {"moves": steps, "goalBucket": b1.name, "otherBucket": b2.amount}
  }
}

class Bucket {
  construct new(name, size) {
    _name = name
    _size = size
    _amount = 0
  }

  name     {_name}
  size     {_size}
  amount   {_amount}

  isFull   {_amount == _size}
  isEmpty  {_amount == 0}
  
  fill()  {
    _amount = _size
  }
  empty() {
    _amount = 0
  }
  add(amt) {
    _amount = _amount + amt
  }
  pourInto(other) {
    var amt = _amount.min(other.size - other.amount)
    other.add(amt)
    _amount = _amount - amt
  }

  toString { "%(this.type)(%(name): %(amount)/%(size))" }
}
