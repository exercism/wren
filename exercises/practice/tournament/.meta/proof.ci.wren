class Team {
  construct new(name) {
    _name = name
    _wins = 0
    _draws = 0
    _losses = 0
  }

  win() {
    _wins = _wins + 1
  }

  draw() {
    _draws = _draws + 1
  }

  loss() {
    _losses = _losses + 1
  }

  name {
    return _name
  }

  matchesPlayed {
    return _wins + _draws + _losses
  }

  points {
    return 3 * _wins + _draws
  }

  toString {
    return _name + " " * (30 - _name.count) + s(matchesPlayed) + s(_wins) + s(_draws) + s(_losses) + s(points) 
  }

  s(number) {
    var digits = number.toString
    return " |" + " " * (3 - digits.count) + digits
  }
}

class Tournament {
  static tally(rows) {
    var teams = []
    for (row in rows) {
      var fields = row.split(";")
      var first = getOrAdd(teams, fields[0])
      var second = getOrAdd(teams, fields[1])
      if (fields[2] == "win") {
        first.win()
        second.loss()
      }
      if (fields[2] == "draw") {
        first.draw()
        second.draw()
      }
      if (fields[2] == "loss") {
        first.loss()
        second.win()
      }
    }
    teams.sort {|a, b| teamLessThan(a, b) }

    var result = []
    result.add("Team                           | MP |  W |  D |  L |  P")
    for (team in teams) {
      result.add(team.toString)
    }
    return result
  }

  static getOrAdd(teams, name) {
    for (team in teams) {
      if (team.name == name) {
        return team
      }
    }

    var team = Team.new(name)
    teams.add(team)
    return team
  }

  static teamLessThan(a, b) {
    if (a.points != b.points) {
      return b.points < a.points
    }
    return stringLessThan(a.name, b.name)
  }

  // From GradeSchool example solution
  static stringLessThan(a, b) {
    var bytesA = a.bytes
    var bytesB = b.bytes
    var countA = a.count
    var countB = b.count

    var minCount = countA.min(countB)
    for (i in 0...minCount) {
      if (bytesA[i] != bytesB[i]) {
        return bytesA[i] < bytesB[i]
      }
    }
    return countA < countB
  }
}
