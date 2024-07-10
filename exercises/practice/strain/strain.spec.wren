import "wren-testie/testie" for Testie, Expect
import "./strain" for Strain

Testie.test("Strain") { |do, skip|
  do.describe("keep") {
    do.test("keep on empty list returns empty list") {
      var predicate = Fn.new { |x| true }
      Expect.value(Strain.keep([], predicate)).toEqual([])
    }

    skip.test("keeps everything") {
      var predicate = Fn.new { |x| true }
      Expect.value(Strain.keep([1, 3, 5], predicate)).toEqual([1, 3, 5])
    }

    skip.test("keeps nothing") {
      var predicate = Fn.new { |x| false }
      Expect.value(Strain.keep([1, 3, 5], predicate)).toEqual([])
    }

    skip.test("keeps first and last") {
      var predicate = Fn.new { |x| x % 2 == 1 }
      Expect.value(Strain.keep([1, 2, 3], predicate)).toEqual([1, 3])
    }

    skip.test("keeps neither first nor last") {
      var predicate = Fn.new { |x| x % 2 == 0 }
      Expect.value(Strain.keep([1, 2, 3], predicate)).toEqual([2])
    }

    skip.test("keeps strings") {
      var predicate = Fn.new { |x| x.startsWith("z") }
      var list = ["apple", "zebra", "banana", "zombies", "cherimoya", "zealot"]
      var results = ["zebra", "zombies", "zealot"]
      Expect.value(Strain.keep(list, predicate)).toEqual(results)
    }

    skip.test("keeps lists") {
      var predicate = Fn.new { |x| x.contains(5) }
      var list = [
        [1, 2, 3],
        [5, 5, 5],
        [5, 1, 2],
        [2, 1, 2],
        [1, 5, 2],
        [2, 2, 1],
        [1, 2, 5]
      ]
      var results = [
        [5, 5, 5],
        [5, 1, 2],
        [1, 5, 2],
        [1, 2, 5]
      ]
      Expect.value(Strain.keep(list, predicate)).toEqual(results)
    }
  }

  do.describe("discard") {
    skip.test("discard on empty list returns empty list") {
      var predicate = Fn.new { |x| true }
      Expect.value(Strain.discard([], predicate)).toEqual([])
    }

    skip.test("discards everything") {
      var predicate = Fn.new { |x| true }
      Expect.value(Strain.discard([1, 3, 5], predicate)).toEqual([])
    }

    skip.test("discards nothing") {
      var predicate = Fn.new { |x| false }
      Expect.value(Strain.discard([1, 3, 5], predicate)).toEqual([1, 3, 5])
    }

    skip.test("discards first and last") {
      var predicate = Fn.new { |x| x % 2 == 1 }
      Expect.value(Strain.discard([1, 2, 3], predicate)).toEqual([2])
    }

    skip.test("discards neither first nor last") {
      var predicate = Fn.new { |x| x % 2 == 0 }
      Expect.value(Strain.discard([1, 2, 3], predicate)).toEqual([1, 3])
    }

    skip.test("discards strings") {
      var predicate = Fn.new { |x| x.startsWith("z") }
      var list = ["apple", "zebra", "banana", "zombies", "cherimoya", "zealot"]
      var results = ["apple", "banana", "cherimoya"]
      Expect.value(Strain.discard(list, predicate)).toEqual(results)
    }

    skip.test("discards lists") {
      var predicate = Fn.new { |x| x.contains(5) }
      var list = [
        [1, 2, 3],
        [5, 5, 5],
        [5, 1, 2],
        [2, 1, 2],
        [1, 5, 2],
        [2, 2, 1],
        [1, 2, 5]
      ]
      var results = [
        [1, 2, 3],
        [2, 1, 2],
        [2, 2, 1]
      ]
      Expect.value(Strain.discard(list, predicate)).toEqual(results)
    }
  }
}

