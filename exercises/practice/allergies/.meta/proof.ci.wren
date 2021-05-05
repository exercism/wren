var BIT = Fn.new { |n| 1 * 2.pow(n) }

var ALLERGENS = {
  "eggs": BIT.call(0),
  "peanuts": BIT.call(1),
  "shellfish": BIT.call(2),
  "strawberries": BIT.call(3),
  "tomatoes": BIT.call(4),
  "chocolate": BIT.call(5),
  "pollen": BIT.call(6),
  "cats": BIT.call(7),
}

class Allergies {
  construct new(bits) {
    _bits = bits
  }

  list() {
    return ALLERGENS.keys.where {|x| allergicTo(x) }.toList
  }

  allergicTo(item) {
    if (ALLERGENS[item]==null) return false
    return ALLERGENS[item] & _bits != 0
  }
}