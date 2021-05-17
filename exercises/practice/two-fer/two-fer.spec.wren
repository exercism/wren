import "./two-fer" for TwoFer
import "./vendor/wren-testie/testie" for Testie, Expect

Testie.test("TwoFer") { |do, skip|

  do.test("no name given") {
    Expect.that(TwoFer.twoFer()).toEqual("One for you, one for me.")
  }

  skip.test("a name given") {
    Expect.that(TwoFer.twoFer("Alice")).toEqual("One for Alice, one for me.")
  }

  skip.test("another name given") {
    Expect.that(TwoFer.twoFer("Bob")).toEqual("One for Bob, one for me.")
  }
}
