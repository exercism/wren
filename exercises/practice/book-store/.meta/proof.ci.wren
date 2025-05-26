class BookStore {
  static total(basket) {
    var tally = [0, 0, 0, 0, 0, 0]
    for (book in basket) {
      tally[book] = tally[book] + 1
    }
    tally.sort()

    var five = tally[1]
    var four = tally[2] - tally[1]
    var three = tally[3] - tally[2]
    var two = tally[4] - tally[3]
    var one = tally[5] - tally[4]

    // Two groups of four are cheaper than a group of five plus a group of three.
    var adjustment = five.min(three)
    five = five - adjustment
    three = three - adjustment
    four = four + 2 * adjustment

    return 5 * five * 600 + 4 * four * 640 + 3 * three * 720 + 2 * two * 760 + 1 * one * 800
  }
}
