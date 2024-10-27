import "./sublist" for Sublist
import "wren-testie/testie" for Testie, Expect

Testie.test("Sublist") { |do, skip|
  do.test("empty lists") {
    var listOne = []
    var listTwo = []
    Expect.value(Sublist.sublist(listOne, listTwo)).toEqual("equal")
  }

  skip.test("empty list within non empty list") {
    var listOne = []
    var listTwo = [1, 2, 3]
    Expect.value(Sublist.sublist(listOne, listTwo)).toEqual("sublist")
  }

  skip.test("non empty list contains empty list") {
    var listOne = [1, 2, 3]
    var listTwo = []
    Expect.value(Sublist.sublist(listOne, listTwo)).toEqual("superlist")
  }

  skip.test("list equals itself") {
    var listOne = [1, 2, 3]
    var listTwo = [1, 2, 3]
    Expect.value(Sublist.sublist(listOne, listTwo)).toEqual("equal")
  }

  skip.test("different lists") {
    var listOne = [1, 2, 3]
    var listTwo = [2, 3, 4]
    Expect.value(Sublist.sublist(listOne, listTwo)).toEqual("unequal")
  }

  skip.test("false start") {
    var listOne = [1, 2, 5]
    var listTwo = [0, 1, 2, 3, 1, 2, 5, 6]
    Expect.value(Sublist.sublist(listOne, listTwo)).toEqual("sublist")
  }

  skip.test("consecutive") {
    var listOne = [1, 1, 2]
    var listTwo = [0, 1, 1, 1, 2, 1, 2]
    Expect.value(Sublist.sublist(listOne, listTwo)).toEqual("sublist")
  }

  skip.test("sublist at start") {
    var listOne = [0, 1, 2]
    var listTwo = [0, 1, 2, 3, 4, 5]
    Expect.value(Sublist.sublist(listOne, listTwo)).toEqual("sublist")
  }

  skip.test("sublist in middle") {
    var listOne = [2, 3, 4]
    var listTwo = [0, 1, 2, 3, 4, 5]
    Expect.value(Sublist.sublist(listOne, listTwo)).toEqual("sublist")
  }

  skip.test("sublist at end") {
    var listOne = [3, 4, 5]
    var listTwo = [0, 1, 2, 3, 4, 5]
    Expect.value(Sublist.sublist(listOne, listTwo)).toEqual("sublist")
  }

  skip.test("at start of superlist") {
    var listOne = [0, 1, 2, 3, 4, 5]
    var listTwo = [0, 1, 2]
    Expect.value(Sublist.sublist(listOne, listTwo)).toEqual("superlist")
  }

  skip.test("in middle of superlist") {
    var listOne = [0, 1, 2, 3, 4, 5]
    var listTwo = [2, 3]
    Expect.value(Sublist.sublist(listOne, listTwo)).toEqual("superlist")
  }

  skip.test("at end of superlist") {
    var listOne = [0, 1, 2, 3, 4, 5]
    var listTwo = [3, 4, 5]
    Expect.value(Sublist.sublist(listOne, listTwo)).toEqual("superlist")
  }

  skip.test("first list missing element from second list") {
    var listOne = [1, 3]
    var listTwo = [1, 2, 3]
    Expect.value(Sublist.sublist(listOne, listTwo)).toEqual("unequal")
  }

  skip.test("second list missing element from first list") {
    var listOne = [1, 2, 3]
    var listTwo = [1, 3]
    Expect.value(Sublist.sublist(listOne, listTwo)).toEqual("unequal")
  }

  skip.test("first list missing additional digits from second list") {
    var listOne = [1, 2]
    var listTwo = [1, 22]
    Expect.value(Sublist.sublist(listOne, listTwo)).toEqual("unequal")
  }

  skip.test("order matters to a list") {
    var listOne = [1, 2, 3]
    var listTwo = [3, 2, 1]
    Expect.value(Sublist.sublist(listOne, listTwo)).toEqual("unequal")
  }

  skip.test("same digits but different numbers") {
    var listOne = [1, 0, 1]
    var listTwo = [10, 1]
    Expect.value(Sublist.sublist(listOne, listTwo)).toEqual("unequal")
  }
}
