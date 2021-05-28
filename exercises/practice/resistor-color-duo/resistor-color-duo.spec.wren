import "wren-testie/testie" for Testie, Expect
import "./resistor-color-duo" for ResistorDuo

Testie.test("Resistor Color Duo") { |do, skip|
  do.test("Brown and black") {
    Expect.that(ResistorDuo.decodedValue(["brown", "black"])).toEqual(10)
  }

  skip.test("Blue and grey") {
    Expect.that(ResistorDuo.decodedValue(["blue", "grey"])).toEqual(68)
  }

  skip.test("Yellow and violet") {
    Expect.that(ResistorDuo.decodedValue(["yellow", "violet"])).toEqual(47)
  }

  skip.test("Orange and orange") {
    Expect.that(ResistorDuo.decodedValue(["orange", "orange"])).toEqual(33)
  }

  skip.test("Ignore additional colors") {
    Expect.that(ResistorDuo.decodedValue(["green", "brown", "orange"])).toEqual(51)
  }
}
