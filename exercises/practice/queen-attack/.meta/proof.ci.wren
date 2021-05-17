class Board {
  static size { 0...8 }
  static sameSquare(pos, pos2) { pos.join(",") == pos2.join(",") }
  static contains(pos) { (size.contains(pos[0]) && size.contains(pos[1])) }
}

var STARTING = { "black": [0, 3], "white": [7, 3] }
class QueenAttack {
  construct new(pieces) {
    _white = pieces["white"] || STARTING["white"]
    _black = pieces["black"] || STARTING["black"]
    validate()
  }
  static new() { QueenAttack.new({}) }
  white { _white }
  black { _black }
  validate() {
    validatePiece(white)
    validatePiece(black)
    if (Board.sameSquare(white,black)) { Fiber.abort("Queens cannot share the same space") }
  }
  validatePiece(piece) {
    if (!Board.contains(piece)) Fiber.abort("Queen must be placed on the board")
  }
  pieceAt(square) {
    if (Board.sameSquare(square,white)) return "W"
    if (Board.sameSquare(square,black)) return "B"
    return "_"
  }
  toString {
    var s = ""
    for (y in Board.size) {
      for (x in Board.size) {
        s = s + pieceAt([y,x]) + " "
      }
      s = s.trim() + "\n"
    }
    return s.trim()
  }

  sameRow { white[0] == black[0] }
  sameColumn { white[1] == black[1] }
  sameDiagonal { (black[0] - white[0]).abs == (black[1] - white[1]).abs }
  canAttack { sameRow || sameColumn || sameDiagonal }
}
