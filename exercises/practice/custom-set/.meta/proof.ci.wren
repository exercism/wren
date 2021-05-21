class CustomSet {
  construct new(list) {
    _data = {}
    addList_(list)
  }
  static new() { CustomSet.new([]) }

  count { _data.count }
  isEmpty { _data.count == 0 }
  contains(value) { _data.containsKey(value) }

  add(item) {
    _data[item] = true
    return this
  }

  subset(set) {
    return items_.all { |item| set.contains(item) }
  }

  disjoint(set) {
    return items_.all { |item| !set.contains(item) }
  }

  eql(set) {
    return set.count == _data.count && subset(set)
  }

  union(set) {
    var s = CustomSet.new()
    s.addList_(items_)
    s.addList_(set.items_)
    return s
  }

  intersection(set) {
    var s = CustomSet.new()
    return s.addList_(items_.where { |item| set.contains(item) })
  }

  difference(set) {
    var s = CustomSet.new()
    return s.addList_(items_.where { |item| !set.contains(item) })
  }

  items_ { _data.keys }
  addList_(list) {
    for (i in list) {
      add(i)
    }
    return this
  }
}
