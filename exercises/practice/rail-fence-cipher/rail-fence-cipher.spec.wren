import "./rail-fence-cipher" for RailFenceCipher
import "wren-testie/testie" for Testie, Expect

Testie.test("rail-fence-cipher.steps()") { |do, skip|
  do.test("encode -> encode with two rails") {
    Expect.value(RailFenceCipher.encode("XOXOXOXOXOXOXOXOXO", 2)).toEqual("XXXXXXXXXOOOOOOOOO")
  }

  skip.test("encode -> encode with three rails") {
    Expect.value(RailFenceCipher.encode("WEAREDISCOVEREDFLEEATONCE", 3)).toEqual("WECRLTEERDSOEEFEAOCAIVDEN")
  }

  skip.test("encode -> encode with ending in the middle") {
    Expect.value(RailFenceCipher.encode("EXERCISES", 4)).toEqual("ESXIEECSR")
  }

  skip.test("decode -> decode with three rails") {
    Expect.value(RailFenceCipher.decode("TEITELHDVLSNHDTISEIIEA", 3)).toEqual("THEDEVILISINTHEDETAILS")
  }

  skip.test("decode -> decode with five rails") {
    Expect.value(RailFenceCipher.decode("EIEXMSMESAORIWSCE", 5)).toEqual("EXERCISMISAWESOME")
  }

  skip.test("decode -> decode with six rails") {
    Expect.value(RailFenceCipher.decode("133714114238148966225439541018335470986172518171757571896261", 6)).toEqual("112358132134558914423337761098715972584418167651094617711286")
  }
}
