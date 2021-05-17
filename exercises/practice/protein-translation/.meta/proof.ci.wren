var CODON_to_PROTEIN = {
  "AUG": "Methionine",
  "UUU": "Phenylalanine",
  "UUC": "Phenylalanine",
  "UUA": "Leucine",
  "UUG": "Leucine",
  "UCU": "Serine",
  "UCC": "Serine",
  "UCA": "Serine",
  "UCG": "Serine",
  "UAU": "Tyrosine",
  "UAC": "Tyrosine",
  "UGU": "Cysteine",
  "UGC": "Cysteine",
  "UGG": "Tryptophan"
}

var STOP_CODONS = ["UAA", "UAG", "UGA"]

class Codon {
  construct new(codon) { _codon = codon }
  isStop { STOP_CODONS.contains(_codon) }
  protein { CODON_to_PROTEIN[_codon] }
  isValid { protein != null }
}

class Tools {
  static translate() { [] }
  static translate(strand) {
    var codons = splitCodons(strand).map { |x| Codon.new(x) }
    var proteins = []
    for (codon in codons) {
      if (codon.isStop) break
      if (!codon.isValid) Fiber.abort("Invalid codon")
      proteins.add(codon.protein)
    }
    return proteins
  }
  static splitCodons(strand) {
    var codons = []
    while (!strand.isEmpty) {
      codons.add(strand.take(3).join(""))
      strand = strand.skip(3)
    }
    return codons
  }
}