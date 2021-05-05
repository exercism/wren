var ORDINALS = [
  null,
  "first",
  "second",
  "third",
  "fourth",
  "fifth",
  "sixth",
  "seventh",
  "eighth",
  "ninth",
  "tenth",
  "eleventh",
  "twelfth",
]

var GIFTS = [
  null,
  "a Partridge in a Pear Tree",
  "two Turtle Doves",
  "three French Hens",
  "four Calling Birds",
  "five Gold Rings",
  "six Geese-a-Laying",
  "seven Swans-a-Swimming",
  "eight Maids-a-Milking",
  "nine Ladies Dancing",
  "ten Lords-a-Leaping",
  "eleven Pipers Piping",
  "twelve Drummers Drumming",
]

class TwelveDays {
  static prefix(verse) {
    return "On the %(ORDINALS[verse]) day of Christmas my true love gave to me: "
  }
  static recite(verseDay) {
    return prefix(verseDay) + toSentence(giftsOn(verseDay)) + "\n"
  }
  static toSentence(items) {
    var day = items.count
    if (day == 1) return "%(items[0])."
    return (day..2).map {|x| items[x-1] }.join(", ") + ", and %(items[0])."
  }
  static giftsOn(day) {
    return (1..day).map {|x| GIFTS[x] }.toList
  }
  static recite(first,last) {
    return (first..last).map {|verse| recite(verse) }.join("\n")
  }
}