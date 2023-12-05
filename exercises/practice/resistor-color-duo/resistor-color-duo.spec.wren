import "wren-testie/testie" for Testie, Expect
import "./resistor-color-duo" for ResistorDuo

Testie.test("Resistor Color Duo") { |do, skip|
  do.test("Brown and black") {
    Expect.value(ResistorDuo.decodedValue(["brown", "black"])).toEqual(10)
  }

  skip.test("Blue and grey") {
    Expect.value(ResistorDuo.decodedValue(["blue", "grey"])).toEqual(68)
  }

  skip.test("Yellow and violet") {
    Expect.value(ResistorDuo.decodedValue(["yellow", "violet"])).toEqual(47)
  }

  skip.test("White and red") {
    Expect.value(ResistorDuo.decodedValue(["white", "red"])).toEqual(92)
  }

  skip.test("Orange and orange") {
    Expect.value(ResistorDuo.decodedValue(["orange", "orange"])).toEqual(33)
  }

  skip.test("Ignore additional colors") {
    Expect.value(ResistorDuo.decodedValue(["green", "brown", "orange"])).toEqual(51)
  }
 
  skip.test("Black and brown, one-digit") {
    Expect.value(ResistorDuo.decodedValue(["black", "brown"])).toEqual(1)
  }
}
