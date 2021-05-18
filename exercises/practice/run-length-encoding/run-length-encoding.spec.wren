import "./run-length-encoding" for RLE
import "./vendor/wren-testie/testie" for Testie, Expect

Testie.test("run-length encode a string") { |do, skip|
  do.describe("run-length encode a string") {
    do.test("encode empty string") {
      Expect.that(RLE.encode("")).toEqual("")
    }

    skip.test("single characters only are encoded without count") {
      Expect.that(RLE.encode("XYZ")).toEqual("XYZ")
    }

    skip.test("encode string with no single characters") {
      Expect.that(RLE.encode("AABBBCCCC")).toEqual("2A3B4C")
    }

    skip.test("encode string with single characters mixed with repeated characters") {
      Expect.that(
        RLE.encode("WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB")
      ).toEqual("12WB12W3B24WB")
    }

    skip.test("encode string with multiple whitespaces") {
      Expect.that(RLE.encode("  hsqq qww  ")).toEqual("2 hs2q q2w2 ")
    }

    skip.test("encode string with lowercase characters") {
      Expect.that(RLE.encode("aabbbcccc")).toEqual("2a3b4c")
    }
  }

  do.describe("run-length decode a string") {
    skip.test("decode empty string") {
      Expect.that(RLE.decode("")).toEqual("")
    }

    skip.test("decode string with single characters only") {
      Expect.that(RLE.decode("XYZ")).toEqual("XYZ")
    }

    skip.test("decode string with no single characters") {
      Expect.that(RLE.decode("2A3B4C")).toEqual("AABBBCCCC")
    }

    skip.test("decode string with single characters mixed with repeated characters") {
      Expect.that(RLE.decode("12WB12W3B24WB")).toEqual(
        "WWWWWWWWWWWWBWWWWWWWWWWWWBBBWWWWWWWWWWWWWWWWWWWWWWWWB"
      )
    }

    skip.test("decode string with multiple whitespaces") {
      Expect.that(RLE.decode("2 hs2q q2w2 ")).toEqual("  hsqq qww  ")
    }

    skip.test("decode string with lowercase characters") {
      Expect.that(RLE.decode("2a3b4c")).toEqual("aabbbcccc")
    }
  }

  do.describe("run-length encode and then decode") {
    skip.test("encode followed by decode gives original string") {
      Expect.that(RLE.decode(RLE.encode("zzz ZZ  zZ"))).toEqual("zzz ZZ  zZ")
    }
  }
}