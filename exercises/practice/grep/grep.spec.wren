import "wren-testie/testie" for Testie, Expect
import "./grep" for Grep
import "io" for File

var testSuite = Testie.new("Grep") { |do, skip|

  do.test("One file, one match, no flags") {
    Expect.value(
      Grep.grep("Agamemnon", ["iliad.txt"])
    ).toBe([
        "Of Atreus, Agamemnon, King of men.",
    ])
  }

  skip.test("One file, one match, print line numbers flag") {
    Expect.value(
      Grep.grep(["-n"], "Forbidden", ["paradise-lost.txt"])
    ).toBe([
        "2:Of that Forbidden Tree, whose mortal tast",
    ])
  }

  skip.test("One file, one match, case-insensitive flag") {
    Expect.value(
      Grep.grep(["-i"], "FORBIDDEN", ["paradise-lost.txt"])
    ).toBe([
        "Of that Forbidden Tree, whose mortal tast",
    ])
  }

  skip.test("One file, one match, print file names flag") {
    Expect.value(
      Grep.grep(["-l"], "Forbidden", ["paradise-lost.txt"])
    ).toBe([
        "paradise-lost.txt",
    ])
  }

  skip.test("One file, one match, match entire lines flag") {
    Expect.value(
      Grep.grep(["-x"], "With loss of Eden, till one greater Man", ["paradise-lost.txt"])
    ).toBe([
        "With loss of Eden, till one greater Man",
    ])
  }

  skip.test("One file, one match, multiple flags") {
    Expect.value(
      Grep.grep(["-n", "-i", "-x"], "OF ATREUS, Agamemnon, KIng of MEN.", ["iliad.txt"])
    ).toBe([
        "9:Of Atreus, Agamemnon, King of men.",
    ])
  }

  skip.test("One file, several matches, no flags") {
    Expect.value(
      Grep.grep("may", ["midsummer-night.txt"])
    ).toBe([
        "Nor how it may concern my modesty,",
        "But I beseech your grace that I may know",
        "The worst that may befall me in this case,",
    ])
  }

  skip.test("One file, several matches, print line numbers flag") {
    Expect.value(
      Grep.grep(["-n"], "may", ["midsummer-night.txt"])
    ).toBe([
        "3:Nor how it may concern my modesty,",
        "5:But I beseech your grace that I may know",
        "6:The worst that may befall me in this case,",
    ])
  }

  skip.test("One file, several matches, match entire lines flag") {
    Expect.value(
      Grep.grep(["-x"], "may", ["midsummer-night.txt"])
    ).toBe([])
  }

  skip.test("One file, several matches, case-insensitive flag") {
    Expect.value(
      Grep.grep(["-i"], "ACHILLES", ["iliad.txt"])
    ).toBe([
        "Achilles sing, O Goddess! Peleus' son;",
        "The noble Chief Achilles from the son",
    ])
  }

  skip.test("One file, several matches, inverted flag") {
    Expect.value(
      Grep.grep(["-v"], "Of", ["paradise-lost.txt"])
    ).toBe([
        "Brought Death into the World, and all our woe,",
        "With loss of Eden, till one greater Man",
        "Restore us, and regain the blissful Seat,",
        "Sing Heav'nly Muse, that on the secret top",
        "That Shepherd, who first taught the chosen Seed",
    ])
  }

  skip.test("One file, no matches, various flags") {
    Expect.value(
      Grep.grep(["-n", "-l", "-x", "-i"], "Gandalf", ["iliad.txt"])
    ).toBe([])
  }

  skip.test("One file, one match, file flag takes precedence over line flag") {
    Expect.value(
      Grep.grep(["-n", "-l"], "ten", ["iliad.txt"])
    ).toBe([
        "iliad.txt",
    ])
  }

  skip.test("One file, several matches, inverted and match entire lines flags") {
    Expect.value(
      Grep.grep(["-x", "-v"], "Illustrious into Ades premature,", ["iliad.txt"])
    ).toBe([
        "Achilles sing, O Goddess! Peleus' son;",
        "His wrath pernicious, who ten thousand woes",
        "Caused to Achaia's host, sent many a soul",
        "And Heroes gave (so stood the will of Jove)",
        "To dogs and to all ravening fowls a prey,",
        "When fierce dispute had separated once",
        "The noble Chief Achilles from the son",
        "Of Atreus, Agamemnon, King of men.",
    ])
  }

  skip.test("Multiple files, one match, no flags") {
    Expect.value(
      Grep.grep("Agamemnon", ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"])
    ).toBe([
        "iliad.txt:Of Atreus, Agamemnon, King of men.",
    ])
  }

  skip.test("Multiple files, several matches, no flags") {
    Expect.value(
      Grep.grep("may", ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"])
    ).toBe([
        "midsummer-night.txt:Nor how it may concern my modesty,",
        "midsummer-night.txt:But I beseech your grace that I may know",
        "midsummer-night.txt:The worst that may befall me in this case,",
    ])
  }

  skip.test("Multiple files, several matches, print line numbers flag") {
    Expect.value(
      Grep.grep(["-n"], "that", ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"])
    ).toBe([
        "midsummer-night.txt:5:But I beseech your grace that I may know",
        "midsummer-night.txt:6:The worst that may befall me in this case,",
        "paradise-lost.txt:2:Of that Forbidden Tree, whose mortal tast",
        "paradise-lost.txt:6:Sing Heav'nly Muse, that on the secret top",
    ])
  }

  skip.test("Multiple files, one match, print file names flag") {
    Expect.value(
      Grep.grep(["-l"], "who", ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"])
    ).toBe([
        "iliad.txt",
        "paradise-lost.txt",
    ])
  }

  skip.test("Multiple files, several matches, case-insensitive flag") {
    Expect.value(
      Grep.grep(["-i"], "TO", ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"])
    ).toBe([
        "iliad.txt:Caused to Achaia's host, sent many a soul",
        "iliad.txt:Illustrious into Ades premature,",
        "iliad.txt:And Heroes gave (so stood the will of Jove)",
        "iliad.txt:To dogs and to all ravening fowls a prey,",
        "midsummer-night.txt:I do entreat your grace to pardon me.",
        "midsummer-night.txt:In such a presence here to plead my thoughts;",
        "midsummer-night.txt:If I refuse to wed Demetrius.",
        "paradise-lost.txt:Brought Death into the World, and all our woe,",
        "paradise-lost.txt:Restore us, and regain the blissful Seat,",
        "paradise-lost.txt:Sing Heav'nly Muse, that on the secret top",
    ])
  }

  skip.test("Multiple files, several matches, inverted flag") {
    Expect.value(
      Grep.grep(["-v"], "a", ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"])
    ).toBe([
        "iliad.txt:Achilles sing, O Goddess! Peleus' son;",
        "iliad.txt:The noble Chief Achilles from the son",
        "midsummer-night.txt:If I refuse to wed Demetrius.",
    ])
  }

  skip.test("Multiple files, one match, match entire lines flag") {
    Expect.value(
      Grep.grep(["-x"], "But I beseech your grace that I may know", ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"])
    ).toBe([
        "midsummer-night.txt:But I beseech your grace that I may know",
    ])
  }

  skip.test("Multiple files, one match, multiple flags") {
    Expect.value(
      Grep.grep(["-n", "-i", "-x"], "WITH LOSS OF EDEN, TILL ONE GREATER MAN", ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"])
    ).toBe([
        "paradise-lost.txt:4:With loss of Eden, till one greater Man",
    ])
  }

  skip.test("Multiple files, no matches, various flags") {
    Expect.value(
      Grep.grep(["-n", "-l", "-x", "-i"], "Frodo", ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"])
    ).toBe([])
  }

  skip.test("Multiple files, several matches, file flag takes precedence over line number flag") {
    Expect.value(
      Grep.grep(["-n", "-l"], "who", ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"])
    ).toBe([
        "iliad.txt",
        "paradise-lost.txt",
    ])
  }

  skip.test("Multiple files, several matches, inverted and match entire lines flags") {
    Expect.value(
      Grep.grep(["-x", "-v"], "Illustrious into Ades premature,", ["iliad.txt", "midsummer-night.txt", "paradise-lost.txt"])
    ).toBe([
        "iliad.txt:Achilles sing, O Goddess! Peleus' son;",
        "iliad.txt:His wrath pernicious, who ten thousand woes",
        "iliad.txt:Caused to Achaia's host, sent many a soul",
        "iliad.txt:And Heroes gave (so stood the will of Jove)",
        "iliad.txt:To dogs and to all ravening fowls a prey,",
        "iliad.txt:When fierce dispute had separated once",
        "iliad.txt:The noble Chief Achilles from the son",
        "iliad.txt:Of Atreus, Agamemnon, King of men.",
        "midsummer-night.txt:I do entreat your grace to pardon me.",
        "midsummer-night.txt:I know not by what power I am made bold,",
        "midsummer-night.txt:Nor how it may concern my modesty,",
        "midsummer-night.txt:In such a presence here to plead my thoughts;",
        "midsummer-night.txt:But I beseech your grace that I may know",
        "midsummer-night.txt:The worst that may befall me in this case,",
        "midsummer-night.txt:If I refuse to wed Demetrius.",
        "paradise-lost.txt:Of Mans First Disobedience, and the Fruit",
        "paradise-lost.txt:Of that Forbidden Tree, whose mortal tast",
        "paradise-lost.txt:Brought Death into the World, and all our woe,",
        "paradise-lost.txt:With loss of Eden, till one greater Man",
        "paradise-lost.txt:Restore us, and regain the blissful Seat,",
        "paradise-lost.txt:Sing Heav'nly Muse, that on the secret top",
        "paradise-lost.txt:Of Oreb, or of Sinai, didst inspire",
        "paradise-lost.txt:That Shepherd, who first taught the chosen Seed",
    ])
  }
}

var TEXT = {
  "iliad.txt": "Achilles sing, O Goddess! Peleus' son;
His wrath pernicious, who ten thousand woes
Caused to Achaia's host, sent many a soul
Illustrious into Ades premature,
And Heroes gave (so stood the will of Jove)
To dogs and to all ravening fowls a prey,
When fierce dispute had separated once
The noble Chief Achilles from the son
Of Atreus, Agamemnon, King of men.",
  "paradise-lost.txt": "Of Mans First Disobedience, and the Fruit
Of that Forbidden Tree, whose mortal tast
Brought Death into the World, and all our woe,
With loss of Eden, till one greater Man
Restore us, and regain the blissful Seat,
Sing Heav'nly Muse, that on the secret top
Of Oreb, or of Sinai, didst inspire
That Shepherd, who first taught the chosen Seed",
  "midsummer-night.txt": "I do entreat your grace to pardon me.
I know not by what power I am made bold,
Nor how it may concern my modesty,
In such a presence here to plead my thoughts;
But I beseech your grace that I may know
The worst that may befall me in this case,
If I refuse to wed Demetrius."
}

testSuite.beforeEach {
  TEXT.each { |entry|
    File.create(entry.key) { |fd| fd.writeBytes(entry.value) }
  }
}
testSuite.afterEach { TEXT.keys.each {|file| File.delete(file)} }

testSuite.run()
