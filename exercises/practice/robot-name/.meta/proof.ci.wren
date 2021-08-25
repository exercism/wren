import "random" for Random

var ALPHA = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
var DIGIT = "0123456789"

/* This implementation initially generates all possible
 * names _first_.  This is initially slower, but
 * significantly improves performance for generating names
 * when we're getting close to consuming all the names.
 *
 * On my laptop, the test suite takes about 13s to run.
 * An implemetation that generates a random name and then
 * checks if it's in use takes about 39s.
 */

class Robot {
  static initialize() {
    __rand = Random.new()
    resetNames()
  }

  static resetNames() {
    __names = []
    for (a1 in ALPHA) {
      for (a2 in ALPHA) {
        for (d1 in DIGIT) {
          for (d2 in DIGIT) {
            for (d3 in DIGIT) {
              __names.add(a1 + a2 + d1 + d2 + d3)
            }
          }
        }
      }
    }
    __rand.shuffle(__names)
  }

  construct new() {
    reset()
  }

  name {_name}

  reset() {
    if (__names.isEmpty) Fiber.abort("All names consumed")
    _name = __names.removeAt(-1)
  }
}

Robot.initialize()
