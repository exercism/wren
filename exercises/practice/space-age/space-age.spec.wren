import "wren-testie/testie" for Testie, Expect
import "./space-age" for Space

Testie.test("Space Age") { |do, skip|
  do.test("age on Earth") {
    Expect.that(Space.age("earth", 1000000000)).toEqual(31.69)
  }

  skip.test("age on Mercury") {
    Expect.that(Space.age("mercury", 2134835688)).toEqual(280.88)
  }

  skip.test("age on Venus") {
    Expect.that(Space.age("venus", 189839836)).toEqual(9.78)
  }

  skip.test("age on Mars") {
    Expect.that(Space.age("mars", 2129871239)).toEqual(35.88)
  }

  skip.test("age on Jupiter") {
    Expect.that(Space.age("jupiter", 901876382)).toEqual(2.41)
  }

  skip.test("age on Saturn") {
    Expect.that(Space.age("saturn", 2000000000)).toEqual(2.15)
  }

  skip.test("age on Uranus") {
    Expect.that(Space.age("uranus", 1210123456)).toEqual(0.46)
  }

  skip.test("age on Neptune") {
    Expect.that(Space.age("neptune", 1821023456)).toEqual(0.35)
  }
}
