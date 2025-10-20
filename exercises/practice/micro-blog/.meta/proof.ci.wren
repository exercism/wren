class MicroBlog {
  static truncate(s) {
    var list = []
    for (cp in s.codePoints) {
      list.add(String.fromCodePoint(cp))
      if (list.count == 5) {
        break
      }
    }
    return list.join("")
  }
}
