class HighScores {
  construct new(scores) { _scores = scores }
  scores { _scores }
  latest { _scores[-1] }
  personalBest { _scores.sort()[-1] }
  personalTopThree { _scores.sort{ |a,b| a > b }.take(3).toList }
}
