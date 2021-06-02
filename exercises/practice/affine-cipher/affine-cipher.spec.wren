import "./affine-cipher" for AffineCipher
import "wren-testie/testie" for Testie, Expect

Testie.test("Affine cipher") { |do, skip|
  do.describe("encode") {
    do.test("encode yes") {
      Expect.that(AffineCipher.encode("yes", { "a": 5, "b": 7 })).toBe("xbt")
    }

    skip.test("encode no") {
      Expect.that(AffineCipher.encode("no", { "a": 15, "b": 18 })).toBe("fu")
    }

    skip.test("encode OMG") {
      Expect.that(AffineCipher.encode("OMG", { "a": 21, "b": 3 })).toBe("lvz")
    }

    skip.test("encode O M G") {
      Expect.that(AffineCipher.encode("O M G", { "a": 25, "b": 47 })).toBe("hjp")
    }

    skip.test("encode mindblowingly") {
      Expect.that(AffineCipher.encode("mindblowingly", { "a": 11, "b": 15 })).toBe("rzcwa gnxzc dgt")
    }

    skip.test("encode numbers") {
      Expect.that(AffineCipher.encode("Testing,1 2 3, testing.", { "a": 3, "b": 4 })).toBe(
        "jqgjc rw123 jqgjc rw"
      )
    }

    skip.test("encode deep thought") {
      Expect.that(AffineCipher.encode("Truth is fiction.", { "a": 5, "b": 17 })).toBe(
        "iynia fdqfb ifje"
      )
    }

    skip.test("encode all the letters") {
      Expect.that(
        AffineCipher.encode("The quick brown fox jumps over the lazy dog.", { "a": 17, "b": 33 })
      ).toBe("swxtj npvyk lruol iejdc blaxk swxmh qzglf")
    }

    skip.test("encode with a not coprime to m") {
      Expect.that {
        AffineCipher.encode("This is a test.", { "a": 6, "b": 17 })
      }.abortsWith("a and m must be coprime.")
    }
  }
  do.describe("decode") {
    do.test("decode exercism") {
      Expect.that(AffineCipher.decode("tytgn fjr", { "a": 3, "b": 7 })).toBe("exercism")
    }

    skip.test("decode a sentence") {
      Expect.that(
        AffineCipher.decode("qdwju nqcro muwhn odqun oppmd aunwd o", { "a": 19, "b": 16 })
      ).toBe("anobstacleisoftenasteppingstone")
    }

    skip.test("decode numbers") {
      Expect.that(AffineCipher.decode("odpoz ub123 odpoz ub", { "a": 25, "b": 7 })).toBe(
        "testing123testing"
      )
    }

    skip.test("decode all the letters") {
      Expect.that(
        AffineCipher.decode("swxtj npvyk lruol iejdc blaxk swxmh qzglf", { "a": 17, "b": 33 })
      ).toBe("thequickbrownfoxjumpsoverthelazydog")
    }

    skip.test("decode with no spaces in input") {
      Expect.that(
        AffineCipher.decode("swxtjnpvyklruoliejdcblaxkswxmhqzglf", { "a": 17, "b": 33 })
      ).toBe("thequickbrownfoxjumpsoverthelazydog")
    }

    skip.test("decode with too many spaces") {
      Expect.that(AffineCipher.decode("vszzm    cly   yd cg    qdp", { "a": 15, "b": 16 })).toBe(
        "jollygreengiant"
      )
    }

    skip.test("decode with a not coprime to m") {
      Expect.that {
        AffineCipher.decode("Test", { "a": 13, "b": 5 })
      }.abortsWith("a and m must be coprime.")
    }
  }
}
