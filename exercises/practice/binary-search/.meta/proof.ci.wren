class BinarySearch {
  static find(values, target) {
    var start = 0
    var stop = values.count - 1

    while (start <= stop) {
      var index = ((start + stop) / 2).truncate
      var value = values[index]

      if (value == target) {
        return index
      }
      
       if (value < target) {
        start = index + 1
      } else {
        stop = index - 1
      }    
    }

    Fiber.abort("value not in list")
  }
}
