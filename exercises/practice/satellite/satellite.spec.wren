import "./satellite" for Satellite
import "wren-testie/testie" for Testie, Expect

Testie.test("Satellite") { |do, skip|
  do.test("Empty tree") {
    var preorder = []
    var inorder = []
    var tree = Satellite.treeFromTraversals(preorder, inorder)
    Expect.value(tree.data).toEqual(null)
  }

  skip.test("Tree with one item") {
    var preorder = ["a"]
    var inorder = ["a"]
    var tree = Satellite.treeFromTraversals(preorder, inorder)
    Expect.value(tree.data).toEqual({
      "data": "a",
      "left": null,
      "right": null
    })
  }

  skip.test("Tree with many items") {
    var preorder = ["a", "i", "x", "f", "r"]
    var inorder = ["i", "a", "f", "x", "r"]
    var tree = Satellite.treeFromTraversals(preorder, inorder)
    Expect.value(tree.data).toEqual({
      "data": "a",
      "left": {
        "data": "i",
        "left": null,
        "right": null
      },
      "right": {
        "data": "x",
        "left": {
          "data": "f",
          "left": null,
          "right": null
        },
        "right": {
          "data": "r",
          "left": null,
          "right": null
        }
      }
    })
  }

  skip.test("Reject traversals of different length") {
    var preorder = ["a", "b"]
    var inorder = ["b", "a", "r"]
    Expect.that {
      Satellite.treeFromTraversals(preorder, inorder)
    }.abortsWith("traversals must have the same length")
  }

  skip.test("Reject inconsistent traversals of same length") {
    var preorder = ["x", "y", "z"]
    var inorder = ["a", "b", "c"]
    Expect.that {
      Satellite.treeFromTraversals(preorder, inorder)
    }.abortsWith("traversals must have the same elements")
  }

  skip.test("Reject traversals with repeated items") {
    var preorder = ["a", "b", "a"]
    var inorder = ["b", "a", "a"]
    Expect.that {
      Satellite.treeFromTraversals(preorder, inorder)
    }.abortsWith("traversals must contain unique items")
  }
}
