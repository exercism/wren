class Strain {
  static keep(list, predicate) {
    var kept = []
    for (item in list) {
      if (predicate.call(item)) {
        kept.add(item)
      }
    }
    return kept
  }

  static discard(list, predicate) {
    return keep(list, Fn.new { |x| !predicate.call(x) })
  }
}

