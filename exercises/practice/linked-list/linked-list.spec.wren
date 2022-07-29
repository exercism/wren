import "wren-testie/testie" for Testie, Expect
import "./linked-list" for LinkedList

Testie.test("LinkedList") { |do, skip|

  do.test("pop gets element from the list") {
    var list = LinkedList.new()
    list.push(7)
    Expect.value(list.pop()).toEqual(7)
  }  

  skip.test("push/pop respectively add/remove at the end of the list") {
    var list = LinkedList.new()
    list.push(11)
    list.push(13)
    var result = []
    result.add(list.pop())
    result.add(list.pop())
    Expect.value(result).toEqual([13, 11])
  }  

  skip.test("shift gets an element from the list") {
    var list = LinkedList.new()
    list.push(17)
    Expect.value(list.shift()).toEqual(17)
  }  

  skip.test("shift gets first element from the list") {
    var list = LinkedList.new()
    list.push(23)
    list.push(5)
    var result = []
    result.add(list.shift())
    result.add(list.shift())
    Expect.value(result).toEqual([23, 5])
  }  

  skip.test("unshift adds element at start of the list") {
    var list = LinkedList.new()
    list.unshift(23)
    list.unshift(5)
    var result = []
    result.add(list.shift())
    result.add(list.shift())
    Expect.value(result).toEqual([5, 23])
  }  

  skip.test("unshift pop") {
    var list = LinkedList.new()
    list.unshift(10)
    list.unshift(20)
    var result = []
    result.add(list.pop())
    result.add(list.pop())
    Expect.value(result).toEqual([10, 20])
  }  

  skip.test("pop, push, shift, and unshift can be used in any order") {
    var result = []
    var list = LinkedList.new()
    list.push(1)
    list.push(2)
    result.add(list.pop())
    list.push(3)
    result.add(list.shift())
    list.unshift(4)
    list.push(5)
    result.add(list.shift())
    result.add(list.pop())
    result.add(list.shift())
    Expect.value(result).toEqual([2,1,4,5,3])
  }  

  skip.test("count an empty list") {
    var list = LinkedList.new()
    Expect.value(list.count).toEqual(0)
  }  

  skip.test("count list with one item") {
    var list = LinkedList.new()
    list.push(42)
    Expect.value(list.count).toEqual(1)
  }  

  skip.test("count a list with items") {
    var result = []
    var list = LinkedList.new()
    list.push(31)
    result.add(list.count)
    list.unshift(43)
    result.add(list.count)
    list.shift()
    result.add(list.count)
    list.pop()
    result.add(list.count)
    Expect.value(result).toEqual([1,2,1,0])
  }  

  skip.test("popping to empty doesn't break the list") {
    var list = LinkedList.new()
    list.push(41)
    list.push(59)
    list.pop()
    list.pop()
    list.push(47)
    Expect.value(list.count).toEqual(1)
  }  

  skip.test("shifting to empty doesn't break the list") {
    var list = LinkedList.new()
    list.push(41)
    list.push(59)
    list.shift()
    list.shift()
    list.push(47)
    Expect.value(list.count).toEqual(1)
  }  

  skip.test("deletes the only element") {
    var list = LinkedList.new()
    list.push(61)
    list.delete(61)
    Expect.value(list.count).toEqual(0)
  }  

  skip.test("deletes the element with the specified value from the list") {
    var list = LinkedList.new()
    list.push(71)
    list.push(83)
    list.push(79)
    list.delete(83)
    Expect.value([list.count, list.pop(), list.shift()])
          .toEqual([2, 79, 71])
  }  

  skip.test("deletes the element with the specified value from the tail, reassigns tail") {
    var list = LinkedList.new()
    list.push(71)
    list.push(83)
    list.push(79)
    list.delete(83)
    Expect.value([list.count, list.pop(), list.pop()])
          .toEqual([2, 79, 71])
  }  

  skip.test("deletes the element with the specified value from the tail, reassigns head") {
    var list = LinkedList.new()
    list.push(71)
    list.push(83)
    list.push(79)
    list.delete(83)
    Expect.value([list.count, list.shift(), list.shift()])
          .toEqual([2, 71, 79])
  }  

  skip.test("deletes the first of two elements") {
    var list = LinkedList.new()
    list.push(97)
    list.push(101)
    list.delete(97)
    Expect.value([list.count, list.pop()])
          .toEqual([1, 101])
  }  

  skip.test("deletes the second of two elements") {
    var list = LinkedList.new()
    list.push(97)
    list.push(101)
    list.delete(101)
    Expect.value([list.count, list.pop()])
          .toEqual([1, 97])
  }  

  skip.test("deletes does not modify the list if the element is not found") {
    var list = LinkedList.new()
    list.push(89)
    list.delete(103)
    Expect.value(list.count).toEqual(1)
  }  

  skip.test("deletes only the first occurrence") {
    var list = LinkedList.new()
    list.push(73)
    list.push(9)
    list.push(9)
    list.push(107)
    list.delete(9)
    var result = [list.count]
    result.add(list.pop())
    result.add(list.pop())
    result.add(list.pop())
    Expect.value(result).toEqual([3,107,9,73])
  }  

  // bonus
  skip.test("iteration") {
    var list = LinkedList.new()
    list.push(10)
    list.push(20)
    list.push(30)

    var result = []
    for (node in list) {
      result.add(node.value / 2)
    }
    Expect.value(result).toEqual([5, 10, 15])
  }
}  
