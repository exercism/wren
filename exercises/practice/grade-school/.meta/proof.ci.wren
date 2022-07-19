class GradeSchool {
  construct new() {
    _directory = {}
  }

  add(student, level) {
    if (_directory.containsKey(student)) {
      return false
    } else {
      _directory[student] = level
      return true
    }
  }

  addAll(students) { students.map {|s| add(s[0], s[1])}.toList }

  roster       { rosterSort_(_directory) }
  grade(level) { rosterSort_(classroom_(level)) }

  // filter the school directory to just this level
  classroom_(level) {
    return _directory.where {|entry| entry.value == level}
                     .reduce({}) {|room, entry|
                        room[entry.key] = entry.value
                        return room
                     }
  }

  // given a map of {name:level}
  // return a list of names sorted first by level then by name
  rosterSort_(directory) {
    return directory.keys.toList.sort{|a, b|
      return directory[a] < directory[b] ||
        (directory[a] == directory[b] && lessThan_(a, b))
    }
  }

  // String does not implement <(_)
  // return true if string `a` < string `b`
  lessThan_(a, b) {
    var bytesA = a.bytes
    var bytesB = b.bytes
    var countA = a.count
    var countB = b.count

    var minCount = countA < countB ? countA : countB
    for (i in 0...minCount) {
      if (bytesA[i] != bytesB[i]) {
        return bytesA[i] < bytesB[i]
      }
    }
    return countA < countB
  }
}
