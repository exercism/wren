import "./grains" for Grains
import "wren-testie/testie" for Testie, Expect

Testie.test("Grains") { |do, skip|

  do.describe("returns the number of grains on the square") {
    do.test("grains on square 1") {
      Expect.that(Grains.square(1)).toEqual(1)
    }

    skip.test("grains on square 2") {
      Expect.that(Grains.square(2)).toEqual(2)
    }

    skip.test("grains on square 3") {
      Expect.that(Grains.square(3)).toEqual(4)
    }

    skip.test("grains on square 4") {
      Expect.that(Grains.square(4)).toEqual(8)
    }

    skip.test("grains on square 16") {
      Expect.that(Grains.square(16)).toEqual(32768)
    }

    skip.test("grains on square 32") {
      Expect.that(Grains.square(32)).toEqual(2147483648)
    }

    skip.test("grains on square 64") {
      Expect.that(Grains.square(64)).toEqual(9223372036854775808)
    }

    skip.test("square 0 raises an exception") {
      Expect.that {
        Grains.square(0)
      }.abortsWith("square must be between 1 and 64")
    }

    skip.test("negative square raises an exception") {
      Expect.that {
        Grains.square(-1)
      }.abortsWith("square must be between 1 and 64")
    }

    skip.test("square greater than 64 raises an exception") {
      Expect.that {
        Grains.square(65)
      }.abortsWith("square must be between 1 and 64")
    }
  }

  skip.test("returns the total number of grains on the board") {
    Expect.that(Grains.total).toEqual(18446744073709551615)
  }
}
