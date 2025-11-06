class PiecingItTogether {
  static jigsawData(partial) {
    var result = null
    for (rows in 2..300) {
      if (partial.containsKey("rows") && rows != partial["rows"]) {
        continue
      }

      for (columns in 2..300) {
        if (partial.containsKey("columns") && columns != partial["columns"]) {
          continue
        }

        var pieces = rows * columns
        if (partial.containsKey("pieces") && pieces != partial["pieces"]) {
          continue
        }

        var border = 2 * (rows + columns - 2)
        if (partial.containsKey("border") && border != partial["border"]) {
          continue
        }

        var inside = pieces - border
        if (partial.containsKey("inside") && inside != partial["inside"]) {
          continue
        }

        var aspectRatio = columns / rows
        if (partial.containsKey("aspectRatio") && aspectRatio != partial["aspectRatio"]) {
          continue
        }

        var format = "square"
        if (columns > rows) {
          format = "landscape"
        }
        if (columns < rows) {
          format = "portrait"
        }
        if (partial.containsKey("format") && format != partial["format"]) {
          continue
        }

        if (result != null) {
          Fiber.abort("Insufficient data")
        }

        result = {
          "rows": rows,
          "columns": columns,
          "pieces": pieces,
          "border": border,
          "inside": inside,
          "aspectRatio": aspectRatio,
          "format": format
        }
      }
    }

    if (result == null) {
      Fiber.abort("Contradictory data")
    }

    return result
  }
}
