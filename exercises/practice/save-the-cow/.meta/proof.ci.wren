class SaveTheCow {
  static guess(word, guesses) {
    var state = "Ongoing"
    var maskedWord = "_" * word.count
    var remainingFailures = 9

    for (g in guesses) {
      if (state == "Lose") {
        Fiber.abort("cannot guess after the game is lost")
      }
      if (state == "Win") {
        Fiber.abort("cannot guess after the game is won")
      }

      if (maskedWord.contains(g) || !word.contains(g)) {
        if (remainingFailures == 0) {
          state = "Lose"
        } else {
          remainingFailures = remainingFailures - 1
        }
      } else {
        for (index in 0...word.count) {
          if (word[index] == g) {
            maskedWord = maskedWord[0...index] + g + maskedWord[index+1...maskedWord.count]
          }
        }

        if (maskedWord == word) {
          state = "Win"
        }
      }
    }

    return {"state": state, "maskedWord": maskedWord, "remainingFailures": remainingFailures}
  }
}
