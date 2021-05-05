import "./vendor/wren-testie/testie" for Testie, Assert
import "./hello-world" for Hello

Testie.test("Hello World") { |do, skip|
  do.test("count one word") {
      Assert.equal("Hello, World!", Hello.world())
  }
}


