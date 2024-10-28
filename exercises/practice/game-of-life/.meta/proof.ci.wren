class GameOfLife {
  static tick(matrix) {
    var result = []
    for (i in 0...matrix.count) {
      result.add([])
      for (j in 0...matrix[i].count) {
        var liveNeighbors = 0
        for (di in -1..1) {
          var ni = i + di
          if (ni < 0 || ni >= matrix.count) {
            continue
          }

          for (dj in -1..1) {
            var nj = j + dj
            if (nj < 0 || nj >= matrix.count) {
              continue
            }

            if (di == 0 && dj == 0) {
              continue
            }

            if (matrix[ni][nj] != 0) {
              liveNeighbors = liveNeighbors + 1
            }
          }
        }

        if (liveNeighbors == 2) {
          result[-1].add(matrix[i][j])
        } else if (liveNeighbors == 3) {
          result[-1].add(1)
        } else {
          result[-1].add(0)
        }
      }
    }
    return result
  }
}
