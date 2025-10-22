import "wren-testie/testie" for Testie, Expect
import "./saddle-points" for Matrix, Point

Testie.test("SaddlePoints") { |do, skip|
  do.test("Can identify single saddle point") {
    var matrix = Matrix.new([
      [9, 8, 7],
      [5, 3, 2],
      [6, 6, 7],
    ])
    var result = matrix.saddlePoints()
    Expect.value(result.count).toEqual(1)
    Expect.value(result[0].row).toEqual(2)
    Expect.value(result[0].column).toEqual(1)
  }

  skip.test("Can identify that empty matrix has no saddle points") {
    var matrix = Matrix.new([
      [],
    ])
    var result = matrix.saddlePoints()
    Expect.value(result.count).toEqual(0)
  }

  skip.test("Can identify lack of saddle points when there are none") {
    var matrix = Matrix.new([
      [1, 2, 3],
      [3, 1, 2],
      [2, 3, 1],
    ])
    var result = matrix.saddlePoints()
    Expect.value(result.count).toEqual(0)
  }

  skip.test("Can identify multiple saddle points in a column") {
    var matrix = Matrix.new([
      [4, 5, 4],
      [3, 5, 5],
      [1, 5, 4],
    ])
    var result = matrix.saddlePoints()
    Expect.value(result.count).toEqual(3)
    Expect.value(result[0].row).toEqual(1)
    Expect.value(result[0].column).toEqual(2)
    Expect.value(result[1].row).toEqual(2)
    Expect.value(result[1].column).toEqual(2)
    Expect.value(result[2].row).toEqual(3)
    Expect.value(result[2].column).toEqual(2)
  }

  skip.test("Can identify multiple saddle points in a row") {
    var matrix = Matrix.new([
      [6, 7, 8],
      [5, 5, 5],
      [7, 5, 6],
    ])
    var result = matrix.saddlePoints()
    Expect.value(result.count).toEqual(3)
    Expect.value(result[0].row).toEqual(2)
    Expect.value(result[0].column).toEqual(1)
    Expect.value(result[1].row).toEqual(2)
    Expect.value(result[1].column).toEqual(2)
    Expect.value(result[2].row).toEqual(2)
    Expect.value(result[2].column).toEqual(3)
  }

  skip.test("Can identify saddle point in bottom right corner") {
    var matrix = Matrix.new([
      [8, 7, 9],
      [6, 7, 6],
      [3, 2, 5],
    ])
    var result = matrix.saddlePoints()
    Expect.value(result.count).toEqual(1)
    Expect.value(result[0].row).toEqual(3)
    Expect.value(result[0].column).toEqual(3)
  }

  skip.test("Can identify saddle points in a non square matrix") {
    var matrix = Matrix.new([
      [3, 1, 3],
      [3, 2, 4],
    ])
    var result = matrix.saddlePoints()
    Expect.value(result.count).toEqual(2)
    Expect.value(result[0].row).toEqual(1)
    Expect.value(result[0].column).toEqual(1)
    Expect.value(result[1].row).toEqual(1)
    Expect.value(result[1].column).toEqual(3)
  }

  skip.test("Can identify that saddle points in a single column matrix are those with the minimum value") {
    var matrix = Matrix.new([
      [2],
      [1],
      [4],
      [1],
    ])
    var result = matrix.saddlePoints()
    Expect.value(result.count).toEqual(2)
    Expect.value(result[0].row).toEqual(2)
    Expect.value(result[0].column).toEqual(1)
    Expect.value(result[1].row).toEqual(4)
    Expect.value(result[1].column).toEqual(1)
  }

  skip.test("Can identify that saddle points in a single row matrix are those with the maximum value") {
    var matrix = Matrix.new([
      [2, 5, 3, 5],
    ])
    var result = matrix.saddlePoints()
    Expect.value(result.count).toEqual(2)
    Expect.value(result[0].row).toEqual(1)
    Expect.value(result[0].column).toEqual(2)
    Expect.value(result[1].row).toEqual(1)
    Expect.value(result[1].column).toEqual(4)
  }
}
