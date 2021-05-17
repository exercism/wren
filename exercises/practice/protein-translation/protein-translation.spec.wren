import "./protein-translation" for Tools
import "./vendor/wren-testie/testie" for Testie, Expect

Testie.test("ProteinTranslation") { |do, skip|
  do.test("Empty RNA has no proteins") {
    Expect.that(Tools.translate()).toEqual([])
  }

  do.describe("Single codons") {
    var mapping = [
      ["Methionine", ["AUG"]],
      ["Phenylalanine", ["UUU", "UUC"]],
      ["Leucine", ["UUA", "UUG"]],
      ["Serine", ["UCU", "UCC", "UCA", "UCG"]],
      ["Tyrosine", ["UAU", "UAC"]],
      ["Cysteine", ["UGU", "UGC"]],
      ["Tryptophan", ["UGG"]],
    ]

    mapping.each { |item|
      var protein = item[0]
      var codons = item[1]
      codons.each { |codon|
        skip.test("%(protein) RNA sequence `%(codon)` translates into %(protein)") {
          Expect.that(Tools.translate(codon)).toEqual([protein])
        }
      }
    }

    var stopCodons = ["UAA", "UAG", "UGA"]
    stopCodons.each { |codon|
      skip.test("STOP codon RNA sequence `%(codon)`") {
        Expect.that(Tools.translate(codon)).toEqual([])
      }
    }
  }

  do.describe("Multiple codons") {
    skip.test("Sequence of two protein codons translates into proteins") {
      Expect.that(Tools.translate("UUUUUU")).toEqual(["Phenylalanine", "Phenylalanine"])
    }

    skip.test("Sequence of two different protein codons translates into proteins") {
      Expect.that(Tools.translate("UUAUUG")).toEqual(["Leucine", "Leucine"])
    }

    skip.test("Translate RNA strand into correct protein list") {
      Expect.that(Tools.translate("AUGUUUUGG")).toEqual([
        "Methionine",
        "Phenylalanine",
        "Tryptophan",
      ])
    }

    skip.test("Translation stops if STOP codon at beginning of sequence") {
      Expect.that(Tools.translate("UAGUGG")).toEqual([])
    }

    skip.test("Translation stops if STOP codon at end of three-codon sequence") {
      Expect.that(Tools.translate("AUGUUUUAA")).toEqual(["Methionine", "Phenylalanine"])
    }

    skip.test("Translation stops if STOP codon in middle of three-codon sequence") {
      Expect.that(Tools.translate("UGGUAGUGG")).toEqual(["Tryptophan"])
    }

    skip.test("Translation stops if STOP codon in middle of six-codon sequence") {
      Expect.that(Tools.translate("UGGUGUUAUUAAUGGUUU")).toEqual([
        "Tryptophan",
        "Cysteine",
        "Tyrosine",
      ])
    }
  }

  do.describe("Unexpected strands") {
    skip.test("Non-existing codon can't translate") {
      Expect.that { Tools.translate("AAA") }.abortsWith("Invalid codon")
    }

    skip.test("Unknown amino acids, not part of a codon, can't translate") {
      Expect.that { Tools.translate("XYZ") }.abortsWith("Invalid codon")
    }

    skip.test("Incomplete RNA sequence can't translate") {
      Expect.that { Tools.translate("AUGU") }.abortsWith("Invalid codon")
    }

    skip.test("Incomplete RNA sequence can translate if valid until a STOP codon") {
      Expect.that(Tools.translate("UUCUUCUAAUGGU")).toEqual([
        "Phenylalanine",
        "Phenylalanine",
      ])
    }
  }
}
