var VALID_NUCLEOTIDES = ["A","C","G","T"]

class Nucleotide {
  static zeroCounts { { "A": 0, "C": 0, "G": 0, "T": 0} }
  static count(strand) {
    var counts = zeroCounts
    strand.each { |n|
      if (!VALID_NUCLEOTIDES.contains(n)) Fiber.abort("Invalid nucleotide in strand")
      counts[n] = counts[n] + 1
    }
    return counts
  }
}
