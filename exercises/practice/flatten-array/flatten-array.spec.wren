import "./flatten-array" for Flatten
import "wren-testie/testie" for Testie, Expect

Testie.test("Flatten Array") { |do, skip|

  do.test("empty") {
    Expect.that(Flatten.flatten([])).toEqual([])
  }

  skip.test("no nesting") {
    Expect.that(Flatten.flatten([0, 1, 2])).toEqual([0, 1, 2])
  }

  skip.test("flattens a nested array") {
    Expect.that(Flatten.flatten([[]])).toEqual([])
  }

  skip.test("flattens array with just integers present") {
    Expect.that(Flatten.flatten([1, [2, 3, 4, 5, 6, 7], 8])).toEqual([
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
    ])
  }

  skip.test("5 level nesting") {
    Expect.that(Flatten.flatten([0, 2, [[2, 3], 8, 100, 4, [[[50]]]], -2])).toEqual([
      0,
      2,
      2,
      3,
      8,
      100,
      4,
      50,
      -2,
    ])
  }

  skip.test("6 level nesting") {
    Expect.that(Flatten.flatten([1, [2, [[3]], [4, [[5]]], 6, 7], 8])).toEqual([
      1,
      2,
      3,
      4,
      5,
      6,
      7,
      8,
    ])
  }

  skip.test("null values are omitted from the final result") {
    Expect.that(Flatten.flatten([1, 2, null])).toEqual([1, 2])
  }

  skip.test("6 level nest list with null values") {
    Expect.that(Flatten.flatten([0, 2, [[2, 3], 8, [[100]], null, [[null]]], -2])).toEqual([
      0,
      2,
      2,
      3,
      8,
      100,
      -2,
    ])
  }

  skip.test("flattens a sequence") {
    // what if we are handed Sequences instead of arrays
    Expect.that(Flatten.flatten([1,[2,[3,null].skip(0),null].skip(0)].skip(0))).toEqual([
      1,2,3
    ])
  }

  skip.test("all values in nested list are null") {
    Expect.that(
      Flatten.flatten([null, [[[null]]], null, null, [[null, null], null], null])
    ).toEqual([])
  }
}
