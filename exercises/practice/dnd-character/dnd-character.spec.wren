import "wren-testie/testie" for Testie, Expect
import "./dnd-character" for Character, Util

Testie.test("D&D Character") { |do, skip|
  do.describe("Ability modifier") {
    do.test("ability modifier for score 3 is -4") {
      Expect.that(Util.abilityModifier(3)).toEqual(-4)
    }

    skip.test("ability modifier for score 4 is -3") {
      Expect.that(Util.abilityModifier(4)).toEqual(-3)
    }

    skip.test("ability modifier for score 5 is -3") {
      Expect.that(Util.abilityModifier(5)).toEqual(-3)
    }

    skip.test("ability modifier for score 6 is -2") {
      Expect.that(Util.abilityModifier(6)).toEqual(-2)
    }

    skip.test("ability modifier for score 7 is -2") {
      Expect.that(Util.abilityModifier(7)).toEqual(-2)
    }

    skip.test("ability modifier for score 8 is -1") {
      Expect.that(Util.abilityModifier(8)).toEqual(-1)
    }

    skip.test("ability modifier for score 9 is -1") {
      Expect.that(Util.abilityModifier(9)).toEqual(-1)
    }

    skip.test("ability modifier for score 10 is 0") {
      Expect.that(Util.abilityModifier(10)).toEqual(0)
    }

    skip.test("ability modifier for score 11 is 0") {
      Expect.that(Util.abilityModifier(11)).toEqual(0)
    }

    skip.test("ability modifier for score 12 is 1") {
      Expect.that(Util.abilityModifier(12)).toEqual(1)
    }

    skip.test("ability modifier for score 13 is 1") {
      Expect.that(Util.abilityModifier(13)).toEqual(1)
    }

    skip.test("ability modifier for score 14 is 2") {
      Expect.that(Util.abilityModifier(14)).toEqual(2)
    }

    skip.test("ability modifier for score 15 is 2") {
      Expect.that(Util.abilityModifier(15)).toEqual(2)
    }

    skip.test("ability modifier for score 16 is 3") {
      Expect.that(Util.abilityModifier(16)).toEqual(3)
    }

    skip.test("ability modifier for score 17 is 3") {
      Expect.that(Util.abilityModifier(17)).toEqual(3)
    }

    skip.test("ability modifier for score 18 is 4") {
      Expect.that(Util.abilityModifier(18)).toEqual(4)
    }

    skip.test("ability score less than 3 throws error") {
      Expect.that{
        Util.abilityModifier(2)
      }.abortsWith("Ability scores must be at least 3")
    }

    skip.test("ability score greater than 18 throws error") {
      Expect.that {
        Util.abilityModifier(19)
      }.abortsWith("Ability scores can be at most 18")
    }
  }

  skip.test("random ability within range") {
    Expect.that(Character.rollAbility()).toBeLessThanOrEqual(18)
    Expect.that(Character.rollAbility()).toBeGreaterThanOrEqual(3)
  }

  skip.test("random character is valid") {
    var Drizzt = Character.new()

    Expect.that(Drizzt.strength).toBeLessThanOrEqual(18)
    Expect.that(Drizzt.strength).toBeGreaterThanOrEqual(3)
    Expect.that(Drizzt.dexterity).toBeLessThanOrEqual(18)
    Expect.that(Drizzt.dexterity).toBeGreaterThanOrEqual(3)
    Expect.that(Drizzt.constitution).toBeLessThanOrEqual(18)
    Expect.that(Drizzt.constitution).toBeGreaterThanOrEqual(3)
    Expect.that(Drizzt.intelligence).toBeLessThanOrEqual(18)
    Expect.that(Drizzt.intelligence).toBeGreaterThanOrEqual(3)
    Expect.that(Drizzt.wisdom).toBeLessThanOrEqual(18)
    Expect.that(Drizzt.wisdom).toBeGreaterThanOrEqual(3)
    Expect.that(Drizzt.charisma).toBeLessThanOrEqual(18)
    Expect.that(Drizzt.charisma).toBeGreaterThanOrEqual(3)
    Expect.that(Drizzt.hitpoints).toEqual(10 + Util.abilityModifier(Drizzt.constitution))
  }

  skip.test("each ability is only calculated once") {
    var Drizzt = Character.new()

    Expect.that(Drizzt.strength).toEqual(Drizzt.strength)
  }
}
