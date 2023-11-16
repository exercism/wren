class Item {
  construct new(weight, value) {
    _weight = weight
    _value = value
  }
  weight { _weight }
  value { _value }
}

class Knapsack {
  static maximumValue(maximumWeight, items) {
    var value = List.filled(maximumWeight + 1, 0)
    for (item in items) {
      if (item.weight > maximumWeight) {
        continue
      }
      // For each weight i, value[i] contains the maximum value achievable
      // with the items seen to date. Each item may only be used once.
      for (i in maximumWeight..(item.weight)) {
        var valueWithItem = value[i - item.weight] + item.value
        if (value[i] < valueWithItem) {
          value[i] = valueWithItem
        }
      }
    }
    return value[-1]
  }
}
