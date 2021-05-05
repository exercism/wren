import "random" for Random
var RND = Random.new()

class Util {
  static abilityModifier(abilityScore) {
    if (abilityScore < 3) { Fiber.abort("Ability scores must be at least 3") }
    if (abilityScore > 18) { Fiber.abort("Ability scores can be at most 18") }
    return ((abilityScore - 10) / 2).floor
  }
}

class Character {
  static dice(n) { (1..n).map { RND.int(6)+1 }.toList }
  static largest(dice, n) { dice.sort().skip(dice.count - n) }
  static rollAbility() { largest(dice(4),3).reduce(0) { |sum, n| sum + n } }
  construct new() {
      _strength = Character.rollAbility()
      _dexterity = Character.rollAbility()
      _constitution = Character.rollAbility()
      _intelligence = Character.rollAbility()
      _wisdom = Character.rollAbility()
      _charisma = Character.rollAbility()
      _hitpoints = 10 + Util.abilityModifier(_constitution)
  }

  strength { _strength }
  dexterity { _dexterity }
  constitution { _constitution }
  intelligence { _intelligence }
  wisdom { _wisdom }
  charisma { _charisma }
  hitpoints { _hitpoints }

}