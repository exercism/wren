import "./atbash-cipher" for Atbash
import "wren-testie/testie" for Testie, Expect

Testie.test("Atbash Cipher") { |do, skip|
  do.describe("encode") {
    do.test("encode yes") {
      Expect.that(Atbash.encode("yes")).toEqual("bvh")
    }

    skip.test("encode no") {
      Expect.that(Atbash.encode("no")).toEqual("ml")
    }

    skip.test("encode OMG") {
      Expect.that(Atbash.encode("OMG")).toEqual("lnt")
    }

    skip.test("encode spaces") {
      Expect.that(Atbash.encode("O M G")).toEqual("lnt")
    }

    skip.test("encode mindblowingly") {
      Expect.that(Atbash.encode("mindblowingly")).toEqual("nrmwy oldrm tob")
    }

    skip.test("encode numbers") {
      var messageToEncode = "Testing,1 2 3, testing."
      var expected = "gvhgr mt123 gvhgr mt"
      Expect.that(Atbash.encode(messageToEncode)).toEqual(expected)
    }

    skip.test("encode deep thought") {
      var messageToEncode = "Truth is fiction."
      var expected = "gifgs rhurx grlm"
      Expect.that(Atbash.encode(messageToEncode)).toEqual(expected)
    }

    skip.test("encode all the letters") {
      var messageToEncode = "The quick brown fox jumps over the lazy dog."
      var expected = "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
      Expect.that(Atbash.encode(messageToEncode)).toEqual(expected)
    }
  }

  do.describe("decode") {
    skip.test("decode exercism") {
      Expect.that(Atbash.decode("vcvix rhn")).toEqual("exercism")
    }

    skip.test("decode a sentence") {
      var messageToDecode = "zmlyh gzxov rhlug vmzhg vkkrm thglm v"
      var expected = "anobstacleisoftenasteppingstone"
      Expect.that(Atbash.decode(messageToDecode)).toEqual(expected)
    }

    skip.test("decode numbers") {
      Expect.that(Atbash.decode("gvhgr mt123 gvhgr mt")).toEqual("testing123testing")
    }

    skip.test("decode all the letters") {
      var messageToDecode = "gsvjf rxpyi ldmul cqfnk hlevi gsvoz abwlt"
      var expected = "thequickbrownfoxjumpsoverthelazydog"
      Expect.that(Atbash.decode(messageToDecode)).toEqual(expected)
    }

    skip.test("decode with too many spaces") {
      Expect.that(Atbash.decode("vc vix    r hn")).toEqual("exercism")
    }

    skip.test("decode with no spaces") {
      var messageToDecode = "zmlyhgzxovrhlugvmzhgvkkrmthglmv"
      var expected = "anobstacleisoftenasteppingstone"
      Expect.that(Atbash.decode(messageToDecode)).toEqual(expected)
    }
  }
}
