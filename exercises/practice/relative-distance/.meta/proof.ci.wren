class RelativeDistance {
  construct new(familyTree) {
    _tree = {}
    for (entry in familyTree) {
      var parent = entry.key
      var children = entry.value
      
      // Parent <-> Child
      for (child in children) {
        addRelationship(parent, child)
        addRelationship(child, parent)
      }

      // Sibling <-> Sibling
      for (child1 in children) {
        for (child2 in children) {
          if (child1 != child2) {
            addRelationship(child1, child2)
            addRelationship(child2, child1)
          }
        }
      }
    }
  }

  addRelationship(personA, personB) {
    if (!_tree.containsKey(personA)) {
      _tree[personA] = []
    }
    if (!_tree[personA].contains(personB)) {
      _tree[personA].add(personB)
    }
  }

  degreeOfSeparation(personA, personB) {
    if (!_tree.containsKey(personA) || !_tree.containsKey(personB)) {
      return null
    }
    if (personA == personB) {
      return 0
    }

    var queue = [[personA, 0]]
    var visited = {}
    visited[personA] = true

    while (queue.count > 0) {
      var pair = queue.removeAt(0)
      var current = pair[0]
      var degree = pair[1]

      if (current == personB) {
        return degree
      }

      var neighbors = _tree[current]
      for (neighbor in neighbors) {
        if (!visited.containsKey(neighbor)) {
          visited[neighbor] = true
          queue.add([neighbor, degree + 1])
        }
      }
    }

    return null
  }
}
