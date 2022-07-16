class Clock {
  construct new(hours, minutes) {
    _minutes = hours * 60 + minutes
    normalize_()
  }

  normalize_() {
    _minutes = _minutes % (24 * 60)
    if (_minutes < 0) { _minutes = _minutes + (24 * 60) }
  }
  minutes { _minutes }

  toString { 
    var asTwoDigitString = Fn.new {|n| n < 10 ? "0%(n)" : "%(n)" }
    var hh = asTwoDigitString.call((_minutes / 60).floor)
    var mm = asTwoDigitString.call(_minutes % 60)
    return "%(hh):%(mm)"
  }

  add(minutes) {
    _minutes = _minutes + minutes
    normalize_()
  }

  subtract(minutes) { add(-minutes) }

  ==(other) { other is type && other.minutes == minutes }
}
