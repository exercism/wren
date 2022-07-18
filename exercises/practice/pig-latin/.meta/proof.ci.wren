class PigLatin {
  static translate(string) {
    return string.split(" ")
                 .map {|w| translateWord(w)}
                 .join(" ")
  }

  static translateWord(string) {
    // split where the first vowel occurs
    var idx = 0
    for (char in string) {
      if ("aeiouy".contains(char)) break
      idx = idx + 1
    }
    var prefix = string[0...idx]
    var suffix = string[idx..-1]

    // quit, square
    if (prefix.endsWith("q") && suffix.startsWith("u")) {
      prefix = prefix + "u"
      suffix = suffix[1..-1]
    }

    // yellow, yttria
    if (prefix == "" && suffix.startsWith("y") && !suffix.startsWith("yt")) {
      prefix = "y"
      suffix = suffix[1..-1]
    }
 
    // rhythm, my
    if (prefix.endsWith("y") && prefix.count > 1) {
      prefix = prefix[0..-2]
      suffix = "y" + suffix
    }

    if (prefix == "xr") {
      prefix = ""
      suffix = string
    }

    return suffix + prefix + "ay"
  }
}

class Math {
  static min(a, b) { a < b ? a : b }
}
