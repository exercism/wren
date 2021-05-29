import "wren-testie/testie" for Testie, Expect
import "./resistor-color" for Resistor, COLORS

Testie.test("Resistor Color") { |do, skip|
  do.describe("Color codes") {
    do.test("Black") {
      Expect.that(Resistor.colorCode("black")).toEqual(0)
    }

    skip.test("White") {
      Expect.that(Resistor.colorCode("white")).toEqual(9)
    }

    skip.test("Orange") {
      Expect.that(Resistor.colorCode("orange")).toEqual(3)
    }
  }

  skip.test("Colors") {
    Expect.that(COLORS).toEqual([
      "black",
      "brown",
      "red",
      "orange",
      "yellow",
      "green",
      "blue",
      "violet",
      "grey",
      "white",
    ])
  }
}
