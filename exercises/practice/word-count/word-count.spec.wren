import "./word-count" for Words
import "./testie/testie" for Testie, Assert

Testie.test("Words") { |do, skip|
  do.test("count one word") {
    var expectedCounts = { "word": 1 }
    // expect(Words.count("word")).toEqual(expectedCounts)
  }

  skip.test("count one of each word") {
    var expectedCounts = { "one": 1, "of": 1, "each": 1 }
    // expect(countWords("one of each")).toEqual(expectedCounts)
  }

  skip.test("multiple occurrences of a word") {
    var expectedCounts = {
      "one": 1,
      "fish": 4,
      "two": 1,
      "red": 1,
      "blue": 1,
    }
    // expect(countWords("one fish two fish red fish blue fish")).toEqual(
    //   expectedCounts
    // )
  }

  skip.test("handles cramped lists") {
    var expectedCounts = {
      "one": 1,
      "two": 1,
      "three": 1,
    }
    // expect(countWords("one,two,three")).toEqual(expectedCounts)
  }

  skip.test("handles expanded lists") {
    var expectedCounts = {
      "one": 1,
      "two": 1,
      "three": 1,
    }
    // expect(countWords("one,\ntwo,\nthree")).toEqual(expectedCounts)
  }

  skip.test("ignore punctuation") {
    var expectedCounts = {
      "car": 1,
      "carpet": 1,
      "as": 1,
      "java": 1,
      "javascript": 1,
    }
    // expect(countWords("car: carpet as java: javascript!!&@$%^&")).toEqual(
    //   expectedCounts
    // )
  }

  skip.test("include numbers") {
    var expectedCounts = {
      "testing": 2,
      "1": 1,
      "2": 1,
    }
    // expect(countWords("testing, 1, 2 testing")).toEqual(expectedCounts)
  }

  skip.test("normalize case") {
    var expectedCounts = {
      "go": 3,
      "stop": 2,
    }
    // expect(countWords("go Go GO Stop stop")).toEqual(expectedCounts)
  }

  skip.test("with apostrophes") {
    var expectedCounts = {
      "first": 1,
      "don't": 2,
      "laugh": 1,
      "then": 1,
      "cry": 1,
    }
    // expect(countWords("First: don't laugh. Then: don't cry.")).toEqual(
    //   expectedCounts
    // )
  }

  skip.test("with quotations") {
    var expectedCounts = {
      "joe": 1,
      "can't": 1,
      "tell": 1,
      "between": 1,
      "large": 2,
      "and": 1,
    }
    // expect(countWords("Joe can't tell between 'large' and large.")).toEqual(
    //   expectedCounts
    // )
  }

  skip.test("substrings from the beginning") {
    var expectedCounts = {
      "joe": 1,
      "can't": 1,
      "tell": 1,
      "between": 1,
      "app": 1,
      "apple": 1,
      "and": 1,
      "a": 1,
    }
    // expect(countWords("Joe can't tell between app, apple and a.")).toEqual(
    //   expectedCounts
    // )
  }

  skip.test("multiple spaces not detected as a word") {
    var expectedCounts = {
      "multiple": 1,
      "whitespaces": 1,
    }
    // expect(countWords(" multiple   whitespaces")).toEqual(expectedCounts)
  }

  skip.test("alternating word separators not detected as a word") {
    var expectedCounts = {
      "one": 1,
      "two": 1,
      "three": 1
    }
    // expect(countWords(",\n,one,\n ,two \n 'three'")).toEqual(expectedCounts)
  }
}
