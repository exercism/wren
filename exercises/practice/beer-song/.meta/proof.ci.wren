class BeerSong {
  static nBottles_(n) {
    if (n==0) return "no more bottles"
    if (n==1) return "1 bottle"
    return "%(n) bottles"
  }
  static verseNoMore {
    return [
      "No more bottles of beer on the wall, no more bottles of beer.",
      "Go to the store and buy some more, 99 bottles of beer on the wall.",
    ]
  }
  static verse(bottles) {
    if (bottles==0) return verseNoMore
    return [
      "%(nBottles_(bottles)) of beer on the wall, %(nBottles_(bottles)) of beer.",
      "Take %(bottles==1 ? "it" : "one") down and pass it around, %(nBottles_(bottles-1)) of beer on the wall.",
    ]
  }
  static recite(bottles, takeDown) {
    var verses = []

    (1..takeDown).each {
      if (!verses.isEmpty) verses.add("")
      verses.addAll(verse(bottles))
      takeDown = takeDown - 1
      bottles = bottles - 1
    }

    return verses
  }
}