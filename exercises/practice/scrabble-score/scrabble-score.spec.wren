import "wren-testie/testie" for Testie, Expect
import "./scrabble-score" for Scrabble

Testie.test("Scrabble") { |do, skip|
  do.test("lowercase letter") {
    Expect.that(Scrabble.score("a")).toEqual(1)
  }

  skip.test("uppercase letter") {
    Expect.that(Scrabble.score("A")).toEqual(1)
  }

  skip.test("valuable letter") {
    Expect.that(Scrabble.score("f")).toEqual(4)
  }

  skip.test("short word") {
    Expect.that(Scrabble.score("at")).toEqual(2)
  }

  skip.test("short, valuable word") {
    Expect.that(Scrabble.score("zoo")).toEqual(12)
  }

  skip.test("medium word") {
    Expect.that(Scrabble.score("street")).toEqual(6)
  }

  skip.test("medium, valuable word") {
    Expect.that(Scrabble.score("quirky")).toEqual(22)
  }

  skip.test("long, mixed-case word") {
    Expect.that(Scrabble.score("OxyphenButazone")).toEqual(41)
  }

  skip.test("english-like word") {
    Expect.that(Scrabble.score("pinata")).toEqual(8)
  }

  skip.test("empty input") {
    Expect.that(Scrabble.score("")).toEqual(0)
  }

  skip.test("entire alphabet available") {
    Expect.that(Scrabble.score("abcdefghijklmnopqrstuvwxyz")).toEqual(87)
  }
}
