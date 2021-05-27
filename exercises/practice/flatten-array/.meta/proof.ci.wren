class Flatten {
  static flatten(list) {
    return flatten_(list, [])
  }
  static flatten_(list, acc_) {
    for (v in list) {
      if (v==null) continue

      // handle both List and Sequence
      if (v is Sequence) {
        flatten_(v, acc_)
      } else {
        acc_.add(v)
      }
    }
    return acc_
  }
}