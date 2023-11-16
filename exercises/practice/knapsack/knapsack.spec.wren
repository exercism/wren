import "./knapsack" for Knapsack, Item
import "wren-testie/testie" for Testie, Expect

Testie.test("Knapsack") { |do, skip|
  do.test("no items") {
    var items = []
    Expect.value(Knapsack.maximumValue(100, items)).toEqual(0)
  }

  skip.test("one item, too heavy") {
    var items = [
      Item.new(100, 1),
    ]
    Expect.value(Knapsack.maximumValue(10, items)).toEqual(0)
  }

  skip.test("five items (cannot be greedy by weight)") {
    var items = [
      Item.new(2, 5),
      Item.new(2, 5),
      Item.new(2, 5),
      Item.new(2, 5),
      Item.new(10, 21),
    ]
    Expect.value(Knapsack.maximumValue(10, items)).toEqual(21)
  }

  skip.test("five items (cannot be greedy by value)") {
    var items = [
      Item.new(2, 20),
      Item.new(2, 20),
      Item.new(2, 20),
      Item.new(2, 20),
      Item.new(10, 50),
    ]
    Expect.value(Knapsack.maximumValue(10, items)).toEqual(80)
  }

  skip.test("example knapsack") {
    var items = [
      Item.new(5, 10),
      Item.new(4, 40),
      Item.new(6, 30),
      Item.new(4, 50),
    ]
    Expect.value(Knapsack.maximumValue(10, items)).toEqual(90)
  }

  skip.test("8 items") {
    var items = [
      Item.new(25, 350),
      Item.new(35, 400),
      Item.new(45, 450),
      Item.new(5, 20),
      Item.new(25, 70),
      Item.new(3, 8),
      Item.new(2, 5),
      Item.new(2, 5),
    ]
    Expect.value(Knapsack.maximumValue(104, items)).toEqual(900)
  }

  skip.test("15 items") {
    var items = [
      Item.new(70, 135),
      Item.new(73, 139),
      Item.new(77, 149),
      Item.new(80, 150),
      Item.new(82, 156),
      Item.new(87, 163),
      Item.new(90, 173),
      Item.new(94, 184),
      Item.new(98, 192),
      Item.new(106, 201),
      Item.new(110, 210),
      Item.new(113, 214),
      Item.new(115, 221),
      Item.new(118, 229),
      Item.new(120, 240),
    ]
    Expect.value(Knapsack.maximumValue(750, items)).toEqual(1458)
  }
}
