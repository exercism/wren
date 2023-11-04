import "./rotational-cipher" for RotationalCipher
import "wren-testie/testie" for Testie, Expect

Testie.test("RotationalCipher.rotate()") { |do, skip|
  do.test("rotate a by 0, same output as input") {
    Expect.value(RotationalCipher.rotate("a", 0)).toEqual("a")
  }

  skip.test("rotate a by 1") {
    Expect.value(RotationalCipher.rotate("a", 1)).toEqual("b")
  }

  skip.test("rotate a by 26, same output as input") {
    Expect.value(RotationalCipher.rotate("a", 26)).toEqual("a")
  }

  skip.test("rotate m by 13") {
    Expect.value(RotationalCipher.rotate("m", 13)).toEqual("z")
  }

  skip.test("rotate n by 13 with wrap around alphabet") {
    Expect.value(RotationalCipher.rotate("n", 13)).toEqual("a")
  }

  skip.test("rotate capital letters") {
    Expect.value(RotationalCipher.rotate("OMG", 5)).toEqual("TRL")
  }

  skip.test("rotate spaces") {
    Expect.value(RotationalCipher.rotate("O M G", 5)).toEqual("T R L")
  }

  skip.test("rotate numbers") {
    Expect.value(RotationalCipher.rotate("Testing 1 2 3 testing", 4)).toEqual("Xiwxmrk 1 2 3 xiwxmrk")
  }

  skip.test("rotate punctuation") {
    Expect.value(RotationalCipher.rotate("Let's eat, Grandma!", 21)).toEqual("Gzo'n zvo, Bmviyhv!")
  }

  skip.test("rotate all letters") {
    Expect.value(RotationalCipher.rotate("The quick brown fox jumps over the lazy dog.", 13)).toEqual("Gur dhvpx oebja sbk whzcf bire gur ynml qbt.")
  }
}
