class Yacht {

  static score(dice, category) {
    var count = Fn.new { |value|
      var matches = dice.where { |die| die == value }
      return matches.count
    }

    var equals = Fn.new { |list1, list2|
      if (list1.count != list2.count) {
        return false
      }
      for (item in list1) {
        if (!list2.contains(item)) {
          return false
        }
      }

      return true
    }

    var uniques = []
    var sum = 0
    for (die in dice) {
      if (!uniques.contains(die)) uniques.add(die)
      sum = sum +  die
    }
    uniques.sort()

    if (category == "yacht" && uniques.count == 1) {
      return 50
    }

    if (category == "ones") {
      return count.call(1) * 1
    }

    if (category == "twos") {
      return count.call(2) * 2
    }

    if (category == "threes") {
      return count.call(3) * 3
    }

    if (category == "fours") {
      return count.call(4) * 4
    }

    if (category == "fives") {
      return count.call(5) * 5
    }

    if (category == "sixes") {
      return count.call(6) * 6
    }

    if (category == "full house") {
      var counts = {}
      for (die in dice) {
        if (!counts.containsKey(die)) {
          counts[die] = 0
        }
        counts[die] = counts[die] + 1
      }
      if (equals.call(counts.values.toList.sort(),  [2, 3])) {
        return sum
      }
    }

    if (category == "four of a kind") {
      if (count.call(1) >= 4) {
        return 1 * 4
      }
      if (count.call(2) >= 4) {
        return 2 * 4
      }
      if (count.call(3) >= 4) {
        return 3 * 4
      }
      if (count.call(4) >= 4) {
        return 4 * 4
      }
      if (count.call(5) >= 4) {
        return 5 * 4
      }
      if (count.call(6) >= 4) {
        return 6 * 4
      }
    }

    if (category == "little straight" && equals.call(uniques, [1, 2, 3, 4, 5])) {
      return 30
    }

    if (category == "big straight" && equals.call(uniques, [2, 3, 4, 5, 6])) {
      return 30
    }

    if (category == "choice") {
      return sum
    }

    return 0
  }
}
