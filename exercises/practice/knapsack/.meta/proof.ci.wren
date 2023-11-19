class Knapsack {
  static maximumValue(maximumWeight, items) {
    var table = List.filled(maximumWeight + 1, 0)
    for (item in items) {
      var weight = item["weight"]
      var value = item["value"]
      if (weight > maximumWeight) {
        continue
      }
      // For each weight i, table[i] contains the maximum value achievable
      // with the items seen to date. Each item may only be used once.
      for (i in maximumWeight..weight) {
        var valueWithItem = table[i - weight] + value
        if (table[i] < valueWithItem) {
          table[i] = valueWithItem
        }
      }
    }
    return table[-1]
  }
}
