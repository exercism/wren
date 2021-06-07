class CharList {
  static [first,last] {
    var bs = first.bytes[0]
    var be = last.bytes[0]
    return (bs..be).map { |x| String.fromByte(x) }.toList
  }
}

class Diamond {
  construct new(letter) {
    _list = CharList["A", letter]
  }
  rows {
    var i = -1
    var topHalf = _list.map {|c|
      i = i + 1
      return row(c, i)
    }.toList
    return mirror(topHalf[-1..0])
  }
  mirror(list) {
    if (list.count == 1) return list
    return list[-1..1] + list
  }
  row(letter, idx) {
    var left = " " * idx
    var right = " " * (_list.count-1-idx)
    return mirror("%(left)%(letter)%(right)")
  }
  static rows(letter) { Diamond.new(letter).rows }
}