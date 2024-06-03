class EliudsEggs {
  static eggCount(number) {
    var count = 0

    while (number != 0) {
      if (number % 2 == 1) {
        count = count + 1
      }

      number = (number / 2).truncate
    }

    return count
  }
}
