import "./vendor/wren-testie/testie" for Testie, Expect
import "./hello-world" for Hello

Testie.test("Hello World") { |do, skip|
  do.test("Say Hi!") {
      Expect.that(Hello.world()).toEqual("Hello, World!")
  }
}


