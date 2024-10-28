class Sublist {
  static sublist(listOne, listTwo) {
    if (listOne.count < listTwo.count) {
      if (isSublist(listOne, listTwo)) {
        return "sublist"
      }
    } else if (listOne.count > listTwo.count) {
      if (isSublist(listTwo, listOne)) {
        return "superlist"
      }
    } else {
      if (isSublist(listOne, listTwo, 0)) {
        return "equal"
      }
    }

    return "unequal"
  }

  static isSublist(listOne, listTwo) {
    for (offset in 0..(listTwo.count - listOne.count)) {
      if (isSublist(listOne, listTwo, offset)) {
        return true
      }
    }
    return false
  }

  static isSublist(listOne, listTwo, offset) {
    for (index in 0...listOne.count) {
      if (listOne[index] != listTwo[offset + index]) {
        return false
      }
    }
    return true
  }
}
