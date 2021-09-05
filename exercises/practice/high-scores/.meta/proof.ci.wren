class HighScores {
  construct new(scores) { _scores = scores[0..-1] }
  scores { _scores }
  latest { _scores[-1] }

  // sort a _copy_ of the scores
  sorted_ { _scores[0..-1].sort{ |a,b| a > b } }

  personalBest { sorted_[0] }
  personalTopThree { sorted_.take(3).toList }
}
