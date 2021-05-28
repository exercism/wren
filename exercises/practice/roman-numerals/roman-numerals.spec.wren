import "./roman-numerals" for Number
import "./vendor/wren-testie/testie" for Testie, Expect

Testie.test("Roman Numerals") { |do, skip|
  do.test("converts 1") { Expect.that(Number.toRoman(1)).toEqual("I") }
  skip.test("converts 2") { Expect.that(Number.toRoman(2)).toEqual("II") }
  skip.test("converts 3") { Expect.that(Number.toRoman(3)).toEqual("III") }
  skip.test("converts 4") { Expect.that(Number.toRoman(4)).toEqual("IV") }
  skip.test("converts 5") { Expect.that(Number.toRoman(5)).toEqual("V") }
  skip.test("converts 6") { Expect.that(Number.toRoman(6)).toEqual("VI") }
  skip.test("converts 9") { Expect.that(Number.toRoman(9)).toEqual("IX") }
  skip.test("converts 27") { Expect.that(Number.toRoman(27)).toEqual("XXVII") }
  skip.test("converts 48") { Expect.that(Number.toRoman(48)).toEqual("XLVIII") }
  skip.test("converts 49") { Expect.that(Number.toRoman(49)).toEqual("XLIX") }
  skip.test("converts 59") { Expect.that(Number.toRoman(59)).toEqual("LIX") }
  skip.test("converts 93") { Expect.that(Number.toRoman(93)).toEqual("XCIII") }
  skip.test("converts 141") { Expect.that(Number.toRoman(141)).toEqual("CXLI") }
  skip.test("converts 163") { Expect.that(Number.toRoman(163)).toEqual("CLXIII") }
  skip.test("converts 402") { Expect.that(Number.toRoman(402)).toEqual("CDII") }
  skip.test("converts 575") { Expect.that(Number.toRoman(575)).toEqual("DLXXV") }
  skip.test("converts 911") { Expect.that(Number.toRoman(911)).toEqual("CMXI") }
  skip.test("converts 1024") { Expect.that(Number.toRoman(1024)).toEqual("MXXIV") }
  skip.test("converts 3000") { Expect.that(Number.toRoman(3000)).toEqual("MMM") }
}
