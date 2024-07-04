class FoodChain {
  /// Recite verse number `n`
  static recite(n) { new().verse(n - 1) }

  /// Recite verses from number `from` to number `to` inclusive
  static recite(from, to) {
    var chain = new()
    var lines = []
    for (n in from..to) {
      lines.addAll(chain.verse(n - 1))
      lines.add("")
    }
    return lines[0...-1]
  }

  construct new() {
    _animals = ["fly", "spider", "bird", "cat", "dog", "goat", "cow", "horse"]
    _phrases = {
      "spider": "It wriggled and jiggled and tickled inside her.",
      "bird": "How absurd to swallow a bird!",
      "cat": "Imagine that, to swallow a cat!",
      "dog": "What a hog, to swallow a dog!",
      "goat": "Just opened her throat and swallowed a goat!",
      "cow": "I don't know how she swallowed a cow!",
      "horse": "She's dead, of course!"
    }
  }

  verse(i) {
    var lines = []
    var animal = _animals[i]
    lines.add("I know an old lady who swallowed a %(animal).")

    if (animal != "fly") {
      lines.add(_phrases[animal])
      if (animal == "horse") {
        return lines
      }

      var predator = animal
      for (j in i..1) {
        var prey = _animals[j - 1]
        var extra = prey == "spider" ? " that wriggled and jiggled and tickled inside her" : ""
        lines.add("She swallowed the %(predator) to catch the %(prey)%(extra).")
        predator = prey
      }
    }

    lines.add("I don't know why she swallowed the fly. Perhaps she'll die.")
    return lines
  }
}
