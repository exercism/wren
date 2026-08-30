class Prism {
  static findSequence(prisms, start) {
    var x = start["x"]
    var y = start["y"]
    var angle = start["angle"]
    var sequence = []

    while (true) {
      var next = nearest(prisms, x, y, angle)
      if (next == null) return sequence

      sequence.add(next["id"])
      x = next["x"]
      y = next["y"]
      angle = (angle + next["angle"]) % 360
    }
  }

  static nearest(prisms, x, y, angle) {
    var radians = angle * Num.pi / 180
    var directionX = radians.cos
    var directionY = radians.sin
    var nearest = null
    var nearestDistance = Num.infinity

    for (prism in prisms) {
      var distance = distanceTo(prism, x, y, directionX, directionY)

      if (distance != null && distance < nearestDistance) {
        nearest = prism
        nearestDistance = distance
      }
    }

    return nearest
  }

  static distanceTo(prism, x, y, directionX, directionY) {
    var dx = prism["x"] - x
    var dy = prism["y"] - y
    var distance = dx * directionX + dy * directionY
    if (distance <= 0.000001) return null

    var offsetX = dx - distance * directionX
    var offsetY = dy - distance * directionY
    var offsetDistanceSquared = offsetX * offsetX + offsetY * offsetY
  
    var distanceSquared = distance * distance
    var scale = distanceSquared > 1 ? distanceSquared : 1

    return offsetDistanceSquared < 0.000001 * scale ? distance : null
  }
}