class IntergalacticTransmission {
  static parity(number) {
    var result = 0
    while (number != 0) {
      // clear least-significant set bit
      number = number ^ (number & (-number))
      result = 1 - result
    }
    return result
  }

  static transmitSequence(message) {
    var result = []
    var index = 0
    var pendingCount = 0
    var pendingData = 0

    while (true) {
      if (pendingCount != 7) {
        if (index < message.count) {
          pendingData = (pendingData << 8) | message[index]
          pendingCount = pendingCount + 8
          index = index + 1
        } else if (pendingCount > 0) {
          pendingData = pendingData << (7 - pendingCount)
          pendingCount = 7
        } else {
          break
        }
      }

      pendingCount = pendingCount - 7
      var data = (pendingData >> pendingCount) & 127
      pendingData = pendingData & 127 // at most 7 bits remain pending

      result.add((data << 1) | parity(data))
    }

    return result
  }

  static decodeMessage(message) {
    var result = []
    var pendingCount = 0
    var pendingData = 0

    for (byte in message) {
      if (parity(byte) != 0) {
        Fiber.abort("wrong parity")
      }

      pendingData = (pendingData << 7) | (byte >> 1)
      pendingCount = pendingCount + 7
      if (pendingCount >= 8) {
        pendingCount = pendingCount - 8
        result.add((pendingData >> pendingCount) & 255)
        pendingData = pendingData & 63 // at most 6 bits remain pending
      }
    }

    return result
  }
}
