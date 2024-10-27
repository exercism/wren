class StateOfTicTacToe {
  static gamestate(board) {
    var countX = 0
    var countO = 0
    var bitsetX = 0
    var bitsetO = 0
    for (row in 0...3) {
      for (column in 0...3) {
        if (board[row][column] == "X") {
          countX = countX + 1
          bitsetX = bitsetX | (1 << (4 * row + column))
        }

        if (board[row][column] == "O") {
          countO = countO + 1
          bitsetO = bitsetO | (1 << (4 * row + column))
        }
      }
    }

    if (countO > countX) {
      Fiber.abort("Wrong turn order: O started")
    }

    if (countX > countO + 1) {
      Fiber.abort("Wrong turn order: X went twice")
    }

    var winX = isWin(bitsetX)
    var winO = isWin(bitsetO)

    if (winX || winO) {
      if (winX && winO) {
        Fiber.abort("Impossible board: game should have ended after the game was won")
      }

      return "win"
    }

    if (countX + countO == 9) {
      return "draw"
    } else {
      return "ongoing"
    }
  }

  static isWin(bitset) {
    var lines = [
      0x007,
      0x070,
      0x700,
      0x111,
      0x222,
      0x444,
      0x124,
      0x421
    ]

    for (line in lines) {
      if ((bitset & line) == line) {
        return true
      }
    }
    return false
  }
}
