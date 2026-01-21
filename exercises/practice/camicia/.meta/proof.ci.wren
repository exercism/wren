class Camicia {
  static val(card) {
    if (card == "J") return 1
    if (card == "Q") return 2
    if (card == "K") return 3
    if (card == "A") return 4
    return 0
  }

  static simulateGame(playerA, playerB) {
    var handA = playerA.map { |c| val(c) }.toList
    var handB = playerB.map { |c| val(c) }.toList
    
    var turn = "A"
    var pile = []
    var seen = {}
    var totalTricks = 0
    var cardsPlayed = 0
    var currentDebt = 0

    while (true) {
      if (pile.isEmpty) {
        var state = "%(handA)%(handB)%(turn)"
        if (seen.containsKey(state)) {
           return {"status": "loop", "tricks": totalTricks, "cards": cardsPlayed}
        }
        seen[state] = true
      }

      var activeHand = (turn == "A") ? handA : handB
      var otherHand = (turn == "A") ? handB : handA

      if (activeHand.isEmpty) {
        var extraTrick = pile.isEmpty ? 0 : 1
        return {"status": "finished", "tricks": totalTricks + extraTrick, "cards": cardsPlayed}
      }

      var cardVal = activeHand.removeAt(0)
      pile.add(cardVal)
      cardsPlayed = cardsPlayed + 1

      if (cardVal > 0) {
        currentDebt = cardVal
        turn = (turn == "A") ? "B" : "A"
      } else {
        if (currentDebt > 0) {
          currentDebt = currentDebt - 1
          if (currentDebt == 0) {
            // Debt paid off
            for (c in pile) {
              otherHand.add(c)
            }
            pile.clear()
            totalTricks = totalTricks + 1
            if (handA.isEmpty || handB.isEmpty) {
               return {"status": "finished", "tricks": totalTricks, "cards": cardsPlayed}
            }
            turn = (turn == "A") ? "B" : "A"
          }
        } else {
          turn = (turn == "A") ? "B" : "A"
        }
      }
    }
  }
}
