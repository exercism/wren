var DNA_TO_RNA = {
  "G": "C",
  "C": "G",
  "T": "A",
  "A": "U"
}

class DNA {
  static toRNA(strand) {
    return strand.map {|x| DNA_TO_RNA[x] }.join("")
  }
}
