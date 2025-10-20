class Stopwatch {
  construct new() {
    _state = "ready"
    _current = 0
    _previous = []
  }

  state() {
    return _state
  }

  currentLap() {
    return Stopwatch.display(_current)
  }

  previousLaps() {
    return _previous.map {|entry| Stopwatch.display(entry) }.toList
  }

  total() {
    var sum = _current
    for (entry in _previous) {
      sum = sum + entry
    }
    return Stopwatch.display(sum)
  }

  start() {
    if (_state == "running") {
      Fiber.abort("cannot start an already running stopwatch")
    }
    _state = "running"
  }

  stop() {
    if (_state != "running") {
      Fiber.abort("cannot stop a stopwatch that is not running")
    }
    _state = "stopped"
  }

  reset() {
    if (_state != "stopped") {
      Fiber.abort("cannot reset a stopwatch that is not stopped")
    }
    _state = "ready"
    _current = 0
    _previous.clear()
  }

  advanceTime(by) {
    if (_state != "running") {
      return
    }
    var list = by.split(":")
    var hours = Num.fromString(list[0])
    var minutes = Num.fromString(list[1])
    var seconds = Num.fromString(list[2])
    _current = _current + 3600 * hours + 60 * minutes + seconds
  }

  lap() {
    if (_state != "running") {
      Fiber.abort("cannot lap a stopwatch that is not running")
    }
    _previous.add(_current)
    _current = 0
  }

  static display(n) {
    var seconds = n % 60
    n = (n - seconds) / 60
    var minutes = n % 60
    var hours = (n - minutes) / 60
    return "%(twoDigit(hours)):%(twoDigit(minutes)):%(twoDigit(seconds))"
  }

  static twoDigit(n) {
    if (n < 10) {
      return "0%(n)"
    }
    return "%(n)"
  }
}
