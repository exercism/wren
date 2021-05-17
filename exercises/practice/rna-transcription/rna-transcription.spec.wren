import "./rna-transcription" for DNA
import "./vendor/wren-testie/testie" for Testie, Expect

Testie.test("RNA Transcription") { |do, skip|
  do.test("empty rna sequence") {
    Expect.that(DNA.toRNA("")).toEqual("")
  }

  skip.test("transcribes cytosine to guanine") {
    Expect.that(DNA.toRNA("C")).toEqual("G")
  }

  skip.test("transcribes guanine to cytosine") {
    Expect.that(DNA.toRNA("G")).toEqual("C")
  }

  skip.test("transcribes thymine to adenine") {
    Expect.that(DNA.toRNA("T")).toEqual("A")
  }

  skip.test("transcribes adenine to uracil") {
    Expect.that(DNA.toRNA("A")).toEqual("U")
  }

  skip.test("transcribes all dna nucleotides to their rna complements") {
    Expect.that(DNA.toRNA("ACGTGGTCTTAA")).toEqual("UGCACCAGAAUU")
  }
}
