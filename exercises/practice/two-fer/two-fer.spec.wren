import "./two-fer" for TwoFer
import "./vendor/wren-testie/testie" for Testie, Assert

Testie.test("TwoFer") { |it|

  it.test("no name given") {
    Assert.equal("One for you, one for me.", TwoFer.twoFer())
  }

  it.test("a name given") {
    Assert.equal("One for Alice, one for me.", TwoFer.twoFer("Alice"))
  }

  it.test("another name given") {
    Assert.equal("One for Bob, one for me.", TwoFer.twoFer("Bob"))
  }
}
