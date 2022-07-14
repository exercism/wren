import "essentials" for Strings

class Isogram {
  static isIsogram(string) {
    var letters = Strings.upcase(string)
                         .bytes
                         .where {|byte| (65..90).contains(byte)}
    var seen = {}
    var result = true

    for (byte in letters) {
      if (seen.containsKey(byte)) {
        result = false
        break
      }
      seen[byte] = true
    }

    return result
  }
}
