import "./connect" for Connect
import "wren-testie/testie" for Testie, Expect

Testie.test("Connect") { |do, skip|
  do.test("an empty board has no winner") {
    var board = [
      ". . . . .",
      " . . . . .",
      "  . . . . .",
      "   . . . . .",
      "    . . . . .",
    ]
    Expect.value(Connect.new(board).winner).toEqual(null)
  }

  skip.test("X can win on a 1x1 board") {
    var board = [
      "X",
    ]
    Expect.value(Connect.new(board).winner).toEqual("X")
  }

  skip.test("O can win on a 1x1 board") {
    var board = [
      "O",
    ]
    Expect.value(Connect.new(board).winner).toEqual("O")
  }

  skip.test("only edges does not make a winner") {
    var board = [
      "O O O X",
      " X . . X",
      "  X . . X",
      "   X O O O",
    ]
    Expect.value(Connect.new(board).winner).toEqual(null)
  }

  skip.test("illegal diagonal does not make a winner") {
    var board = [
      "X O . .",
      " O X X X",
      "  O X O .",
      "   . O X .",
      "    X X O O",
    ]
    Expect.value(Connect.new(board).winner).toEqual(null)
  }

  skip.test("nobody wins crossing adjacent angles") {
    var board = [
      "X . . .",
      " . X O .",
      "  O . X O",
      "   . O . X",
      "    . . O .",
    ]
    Expect.value(Connect.new(board).winner).toEqual(null)
  }

  skip.test("X wins crossing from left to right") {
    var board = [
      ". O . .",
      " O X X X",
      "  O X O .",
      "   X X O X",
      "    . O X .",
    ]
    Expect.value(Connect.new(board).winner).toEqual("X")
  }

  skip.test("O wins crossing from top to bottom") {
    var board = [
      ". O . .",
      " O X X X",
      "  O O O .",
      "   X X O X",
      "    . O X .",
    ]
    Expect.value(Connect.new(board).winner).toEqual("O")
  }

  skip.test("X wins using a convoluted path") {
    var board = [
      ". X X . .",
      " X . X . X",
      "  . X . X .",
      "   . X X . .",
      "    O O O O O",
    ]
    Expect.value(Connect.new(board).winner).toEqual("X")
  }

  skip.test("X wins using a spiral path") {
    var board = [
      "O X X X X X X X X",
      " O X O O O O O O O",
      "  O X O X X X X X O",
      "   O X O X O O O X O",
      "    O X O X X X O X O",
      "     O X O O O X O X O",
      "      O X X X X X O X O",
      "       O O O O O O O X O",
      "        X X X X X X X X O",
    ]
    Expect.value(Connect.new(board).winner).toEqual("X")
  }
}
