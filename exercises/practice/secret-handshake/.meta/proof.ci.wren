class SecretHandshake {
  static commands(code) {
    var actions = ["wink", "double blink", "close your eyes", "jump"]

    var result = []
    for (i in 0...actions.count) {
      if (isBitSet_(code, i)) result.add(actions[i])
    }

    return isBitSet_(code, actions.count) ? reverse_(result) : result
  }

  static isBitSet_(n, i) { (n >> i) & 1 == 1 }

  static reverse_(list) { list.reduce([]) {|rev, elem| [elem] + rev} }
}
