class House {
  static recite(startVerse, endVerse) {
    var text = "This is the horse and the hound and the horn that belonged to the farmer sowing his corn that kept the rooster that crowed in the morn that woke the priest all shaven and shorn that married the man all tattered and torn that kissed the maiden all forlorn that milked the cow with the crumpled horn that tossed the dog that worried the cat that killed the rat that ate the malt that lay in the house that Jack built."
    var table = [null, 388, 367, 350, 330, 309, 266, 231, 189, 144, 98, 61, 7]

    var result = []
    for (verse in startVerse..endVerse) {
      result.add("This is" + text[table[verse]..-1])
    }

    return result
  }
}
