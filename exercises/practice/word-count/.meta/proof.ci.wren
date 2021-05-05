class Strings {
    static downcase(s) {
        return s.bytes.map { |x|
            if ((65..90).contains(x)) x = x + 32
            return String.fromByte(x)
        }.join("")
    }
    static split(s, list) {
      var items = []
      var last = 0
      var i = 0
      for (c in s) {
        if (list.contains(c)) {
          if (last != i) items.add(s[last...i])
          last = i + 1
        }
        i = i + 1
      }
      if (last !=i ) {
        items.add(s[last..-1])
      }
      return items
    }
}

var LOWERCASE = (97..122)
var NUMBERS = (48..57)

class Words {
  static count(sentence) {
    var count = {}
    words(sentence).each { |word|
      count[word] = count[word] || 0
      count[word] = count[word] + 1
    }
    return count
  }
  static apostrophe(l) { l == 39 }
  static lowercase(l) { LOWERCASE.contains(l) }
  static numeric(l) { NUMBERS.contains(l) }
  static clean(word) {
    // return word.trim(",").trim("'").trim(".").trim(":")
    return word.bytes.where { |x| lowercase(x) || numeric(x) || apostrophe(x) }.map { |x| String.fromByte(x) }.join("")
  }
  static words(s) {
    return Strings.split(s, [" ",",","\n"]).
      map {|x| Strings.downcase(x) }.
      map {|x| x.trim("'") }.
      map {|x| clean(x) }.
      where { |x| x.trim() != "" }
  }
}