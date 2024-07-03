class PhoneNumber {
  static clean(input) {
    // remove valid non-digits
    var ok = ["+", "(", ")", " ", "-", "."]
    var cleaned = ok.reduce(input) {|s, char| s.replace(char, "")}

    // check for invalid characters
    // anything other than digits and lettes is "punctuation"
    var cps = cleaned.codePoints
    if (cps.any {|cp| (65 <= cp && cp <= 90) || (97 <= cp && cp <= 122)}) {
      Fiber.abort("letters not permitted")
    }
    if (cps.any {|cp| cp < 48 || cp > 57}) {
      Fiber.abort("punctuations not permitted")
    }

    // validate length
    if (cleaned.count < 10) {
      Fiber.abort("must not be fewer than 10 digits")
    }
    if (cleaned.count > 11) {
      Fiber.abort("must not be greater than 11 digits")
    }
    if (cleaned.count == 11) {
      if (cleaned[0] != "1") {
        Fiber.abort("11 digits must start with 1")
      }
      cleaned = cleaned[1..-1]
    }

    // validate area code and exchange code
    if (cleaned[0] == "0") {
      Fiber.abort("area code cannot start with zero")
    }
    if (cleaned[0] == "1") {
      Fiber.abort("area code cannot start with one")
    }
    if (cleaned[3] == "0") {
      Fiber.abort("exchange code cannot start with zero")
    }
    if (cleaned[3] == "1") {
      Fiber.abort("exchange code cannot start with one")
    }

    return cleaned
  }
}
