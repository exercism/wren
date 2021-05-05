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

class Words {
  static count(sentence) {
    var count = {}
    words(sentence).each { |word|
      count[word] = count[word] || 0
      count[word] = count[word] + 1
    }
    return count
  }
  static words(s) {
    return Strings.split(s, [" ",","]).
      map {|x| x.trim(",").trim("'").trim(".") }.
      map {|x| Strings.downcase(x) }.
      where { |x| x.trim() != "" }
  }
}