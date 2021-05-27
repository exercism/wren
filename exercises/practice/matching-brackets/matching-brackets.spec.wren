import "./matching-brackets" for Brackets
import "./vendor/wren-testie/testie" for Testie, Expect

Testie.test("Matching Brackets") { |do, skip|
  do.test("paired square brackets") {
    Expect.that(Brackets.isPaired("[]")).toEqual(true)
  }

  skip.test("empty string") {
    Expect.that(Brackets.isPaired("")).toEqual(true)
  }

  skip.test("unpaired brackets") {
    Expect.that(Brackets.isPaired("[[")).toEqual(false)
  }

  skip.test("wrong ordered brackets") {
    Expect.that(Brackets.isPaired("}{")).toEqual(false)
  }

  skip.test("wrong closing bracket") {
    Expect.that(Brackets.isPaired("{]")).toEqual(false)
  }

  skip.test("paired with whitespace") {
    Expect.that(Brackets.isPaired("{ }")).toEqual(true)
  }

  skip.test("partially paired brackets") {
    Expect.that(Brackets.isPaired("{[])")).toEqual(false)
  }

  skip.test("simple nested brackets") {
    Expect.that(Brackets.isPaired("{[]}")).toEqual(true)
  }

  skip.test("several paired brackets") {
    Expect.that(Brackets.isPaired("{}[]")).toEqual(true)
  }

  skip.test("paired and nested brackets") {
    Expect.that(Brackets.isPaired("([{}({}[])])")).toEqual(true)
  }

  skip.test("unopened closing brackets") {
    Expect.that(Brackets.isPaired("{[)][]}")).toEqual(false)
  }

  skip.test("unpaired and nested brackets") {
    Expect.that(Brackets.isPaired("([{])")).toEqual(false)
  }

  skip.test("paired and wrong nested brackets") {
    Expect.that(Brackets.isPaired("[({]})")).toEqual(false)
  }

  skip.test("paired and incomplete brackets") {
    Expect.that(Brackets.isPaired("{}[")).toEqual(false)
  }

  skip.test("too many closing brackets") {
    Expect.that(Brackets.isPaired("[]]")).toEqual(false)
  }

  skip.test("math expression") {
    Expect.that(Brackets.isPaired("(((185 + 223.85) * 15) - 543)/2")).toEqual(true)
  }

  skip.test("complex latex expression") {
    Expect.that(
      Brackets.isPaired(
        "\\left(\\begin{array}{cc} \\frac{1}{3} & x\\\\ \\mathrm{e}^{x} &... x^2 \\end{array}\\right)"
      )
    ).toEqual(true)
  }
}
