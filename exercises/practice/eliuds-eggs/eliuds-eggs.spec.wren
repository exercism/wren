import "./eliuds-eggs" for EliudsEggs
import "wren-testie/testie" for Testie, Expect

Testie.test("EliudsEggs") { |do, skip|
  do.test("0 eggs") {
    var actual = EliudsEggs.eggCount(0)
    Expect.value(actual).toEqual(0)
  }

  skip.test("1 egg") {
    var actual = EliudsEggs.eggCount(16)
    Expect.value(actual).toEqual(1)
  }

  skip.test("4 eggs") {
    var actual = EliudsEggs.eggCount(89)
    Expect.value(actual).toEqual(4)
  }

  skip.test("13 eggs") {
    var actual = EliudsEggs.eggCount(2000000000)
    Expect.value(actual).toEqual(13)
  }
}

