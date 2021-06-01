import "wren-testie/testie" for Testie, Expect
import "./bob" for Bob

Testie.test("Bob") { |do, skip|
  do.test("stating something") {
    var result = Bob.hey("Tom-ay-to, tom-aaaah-to.")
    Expect.that(result).toEqual("Whatever.")
  }

  skip.test("shouting") {
    var result = Bob.hey("WATCH OUT!")
    Expect.that(result).toEqual("Whoa, chill out!")
  }

  skip.test("shouting gibberish") {
    var result = Bob.hey("FCECDFCAAB")
    Expect.that(result).toEqual("Whoa, chill out!")
  }

  skip.test("asking a question") {
    var result = Bob.hey("Does this cryogenic chamber make me look fat?")
    Expect.that(result).toEqual("Sure.")
  }

  skip.test("asking a numeric question") {
    var result = Bob.hey("You are, what, like 15?")
    Expect.that(result).toEqual("Sure.")
  }

  skip.test("asking gibberish") {
    var result = Bob.hey("fffbbcbeab?")
    Expect.that(result).toEqual("Sure.")
  }

  skip.test("talking forcefully") {
    var result = Bob.hey("Let's go make out behind the gym!")
    Expect.that(result).toEqual("Whatever.")
  }

  skip.test("using acronyms in regular speech") {
    var result = Bob.hey("It's OK if you don't want to go to the DMV.")
    Expect.that(result).toEqual("Whatever.")
  }

  skip.test("forceful question") {
    var result = Bob.hey("WHAT THE HELL WERE YOU THINKING?")
    Expect.that(result).toEqual("Calm down, I know what I'm doing!")
  }

  skip.test("shouting numbers") {
    var result = Bob.hey("1, 2, 3 GO!")
    Expect.that(result).toEqual("Whoa, chill out!")
  }

  skip.test("no letters") {
    var result = Bob.hey("1, 2, 3")
    Expect.that(result).toEqual("Whatever.")
  }

  skip.test("question with no letters") {
    var result = Bob.hey("4?")
    Expect.that(result).toEqual("Sure.")
  }

  skip.test("shouting with special characters") {
    var result = Bob.hey("ZOMG THE \%^*@#$(*^ ZOMBIES ARE COMING!!11!!1!")
    Expect.that(result).toEqual("Whoa, chill out!")
  }

  skip.test("shouting with no exclamation mark") {
    var result = Bob.hey("I HATE YOU")
    Expect.that(result).toEqual("Whoa, chill out!")
  }

  skip.test("statement containing question mark") {
    var result = Bob.hey("Ending with a ? means a question.")
    Expect.that(result).toEqual("Whatever.")
  }

  skip.test("non-letters with question") {
    var result = Bob.hey(":) ?")
    Expect.that(result).toEqual("Sure.")
  }

  skip.test("prattling on") {
    var result = Bob.hey("Wait! Hang on. Are you going to be OK?")
    Expect.that(result).toEqual("Sure.")
  }

  skip.test("silence") {
    var result = Bob.hey("")
    Expect.that(result).toEqual("Fine. Be that way!")
  }

  skip.test("prolonged silence") {
    var result = Bob.hey("          ")
    Expect.that(result).toEqual("Fine. Be that way!")
  }

  skip.test("alternate silence") {
    var result = Bob.hey("\t\t\t\t\t\t\t\t\t\t")
    Expect.that(result).toEqual("Fine. Be that way!")
  }

  skip.test("multiple line question") {
    var result = Bob.hey("\nDoes this cryogenic chamber make me look fat?\nno")
    Expect.that(result).toEqual("Whatever.")
  }

  skip.test("starting with whitespace") {
    var result = Bob.hey("         hmmmmmmm...")
    Expect.that(result).toEqual("Whatever.")
  }

  skip.test("ending with whitespace") {
    var result = Bob.hey("Okay if like my  spacebar  quite a bit?   ")
    Expect.that(result).toEqual("Sure.")
  }

  skip.test("other whitespace") {
    var result = Bob.hey("\n\r \t")
    Expect.that(result).toEqual("Fine. Be that way!")
  }

  skip.test("non-question ending with whitespace") {
    var result = Bob.hey("This is a statement ending with whitespace      ")
    Expect.that(result).toEqual("Whatever.")
  }
}
