import "wren-testie/testie" for Testie, Expect
import "./binary-search-tree" for BinarySearchTree

Testie.test("Binary Search Tree") { |do, skip|
  do.test("data is retained") {
    var result = BinarySearchTree.new(4).data
    Expect.value(result).toEqual({
      "data": 4,
      "left": null,
      "right": null
    })
  }

  do.describe("insert data at proper node") {
    skip.test("smaller number at left node") {
      var result = BinarySearchTree.addAll([4, 2]).data
      Expect.value(result).toEqual({
        "data": 4,
        "left": {
          "data": 2,
          "left": null,
          "right": null
        },
        "right": null
      })
    }

    skip.test("same number at left node") {
      var result = BinarySearchTree.addAll([4, 4]).data
      Expect.value(result).toEqual({
        "data": 4,
        "left": {
          "data": 4,
          "left": null,
          "right": null
        },
        "right": null
      })
    }

    skip.test("greater number at right node") {
      var result = BinarySearchTree.addAll([4, 5]).data
      Expect.value(result).toEqual({
        "data": 4,
        "left": null,
        "right": {
          "data": 5,
          "left": null,
          "right": null
        }
      })
    }

    skip.test("can create complex tree") {
      var result = BinarySearchTree.addAll([4, 2, 6, 1, 3, 5, 7]).data
      Expect.value(result).toEqual({
        "data": 4,
        "left": {
          "data": 2,
          "left": {
            "data": 1,
            "left": null,
            "right": null
          },
          "right": {
            "data": 3,
            "left": null,
            "right": null
          }
        },
        "right": {
          "data": 6,
          "left": {
            "data": 5,
            "left": null,
            "right": null
          },
          "right": {
            "data": 7,
            "left": null,
            "right": null
          }
        }
      })
    }
  }

  do.describe("can sort data") {
    skip.test("can sort single number") {
      var result = BinarySearchTree.addAll([2]).sortedData
      Expect.value(result).toEqual([2])
    }

    skip.test("can sort if second number is smaller than first") {
      var result = BinarySearchTree.addAll([2, 1]).sortedData
      Expect.value(result).toEqual([1, 2])
    }

    skip.test("can sort if second number is same as first") {
      var result = BinarySearchTree.addAll([2, 2]).sortedData
      Expect.value(result).toEqual([2, 2])
    }

    skip.test("can sort if second number is greater than first") {
      var result = BinarySearchTree.addAll([2, 3]).sortedData
      Expect.value(result).toEqual([2, 3])
    }

    skip.test("can sort complex tree") {
      var result = BinarySearchTree.addAll([2, 1, 3, 6, 7, 5]).sortedData
      Expect.value(result).toEqual([1, 2, 3, 5, 6, 7])
    }
  }
}
