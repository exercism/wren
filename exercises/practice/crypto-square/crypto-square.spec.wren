import "./crypto-square" for CryptoSquare
import "wren-testie/testie" for Testie, Expect

Testie.test("CryptoSquare.ciphertext()") { |do, skip|
  do.test("empty plaintext results in an empty ciphertext") {
    Expect.value(CryptoSquare.ciphertext("")).toEqual("")
  }

  skip.test("normalization results in empty plaintext") {
    Expect.value(CryptoSquare.ciphertext("... --- ...")).toEqual("")
  }

  skip.test("Lowercase") {
    Expect.value(CryptoSquare.ciphertext("A")).toEqual("a")
  }

  skip.test("Remove spaces") {
    Expect.value(CryptoSquare.ciphertext("  b ")).toEqual("b")
  }

  skip.test("Remove punctuation") {
    Expect.value(CryptoSquare.ciphertext("@1,\%!")).toEqual("1")
  }

  skip.test("9 character plaintext results in 3 chunks of 3 characters") {
    Expect.value(CryptoSquare.ciphertext("This is fun!")).toEqual("tsf hiu isn")
  }

  skip.test("8 character plaintext results in 3 chunks, the last one with a trailing space") {
    Expect.value(CryptoSquare.ciphertext("Chill out.")).toEqual("clu hlt io ")
  }

  skip.test("54 character plaintext results in 7 chunks, the last two with trailing spaces") {
    Expect.value(CryptoSquare.ciphertext("If man was meant to stay on the ground, god would have given us roots.")).toEqual("imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn  sseoau ")
  }
}
