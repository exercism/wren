import "./pascals-triangle" for PascalsTriangle
import "wren-testie/testie" for Testie, Expect

Testie.test("PascalsTriangle") { |do, skip|
  do.test("zero rows") {
    Expect.value(PascalsTriangle.rows(0)).toEqual([])
  }

  skip.test("single row") {
    Expect.value(PascalsTriangle.rows(1)).toEqual([
      [1],
    ])
  }

  skip.test("two rows") {
    Expect.value(PascalsTriangle.rows(2)).toEqual([
      [1],
      [1, 1],
    ])
  }

  skip.test("three rows") {
    Expect.value(PascalsTriangle.rows(3)).toEqual([
      [1],
      [1, 1],
      [1, 2, 1],
    ])
  }

  skip.test("four rows") {
    Expect.value(PascalsTriangle.rows(4)).toEqual([
      [1],
      [1, 1],
      [1, 2, 1],
      [1, 3, 3, 1],
    ])
  }

  skip.test("five rows") {
    Expect.value(PascalsTriangle.rows(5)).toEqual([
      [1],
      [1, 1],
      [1, 2, 1],
      [1, 3, 3, 1],
      [1, 4, 6, 4, 1],
    ])
  }

  skip.test("six rows") {
    Expect.value(PascalsTriangle.rows(6)).toEqual([
      [1],
      [1, 1],
      [1, 2, 1],
      [1, 3, 3, 1],
      [1, 4, 6, 4, 1],
      [1, 5, 10, 10, 5, 1],
    ])
  }

  skip.test("ten rows") {
    Expect.value(PascalsTriangle.rows(10)).toEqual([
      [1],
      [1, 1],
      [1, 2, 1],
      [1, 3, 3, 1],
      [1, 4, 6, 4, 1],
      [1, 5, 10, 10, 5, 1],
      [1, 6, 15, 20, 15, 6, 1],
      [1, 7, 21, 35, 35, 21, 7, 1],
      [1, 8, 28, 56, 70, 56, 28, 8, 1],
      [1, 9, 36, 84, 126, 126, 84, 36, 9, 1],
    ])
  }
}
