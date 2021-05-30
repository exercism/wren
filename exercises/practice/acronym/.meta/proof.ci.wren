class Strings {
    static upcase(s) {
        return s.bytes.map { |x|
            if ((97..122).contains(x)) x = x - 32
            return String.fromByte(x)
        }.join("")
    }
}

class Acronym {
  static parse(s) {
    return s.replace("'","").
      // REGEX would be nicer
      replace("-"," ").
      replace("_"," ").
      split(" ").where {|x| x != "" }.
      map {|x| Strings.upcase(x[0]) }.
      join("")
  }
}