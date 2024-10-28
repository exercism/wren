class Proverb {
  static recite(strings) {
    var result = []
    for (index in 0...strings.count) {
      var line = null
      if (index + 1 < strings.count) {
        line = "For want of a %(strings[index]) the %(strings[index + 1]) was lost."
      } else {
        line = "And all for the want of a %(strings[0])."
      }
      result.add(line)
    }
    return result
  }
}
