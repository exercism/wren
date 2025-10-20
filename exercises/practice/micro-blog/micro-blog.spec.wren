import "./micro-blog" for MicroBlog
import "wren-testie/testie" for Testie, Expect

Testie.test("MicroBlog") { |do, skip|
  do.test("English language short") {
    Expect.value(MicroBlog.truncate("Hi")).toEqual("Hi")
  }

  skip.test("English language long") {
    Expect.value(MicroBlog.truncate("Hello there")).toEqual("Hello")
  }

  skip.test("German language short (broth)") {
    Expect.value(MicroBlog.truncate("brühe")).toEqual("brühe")
  }

  skip.test("German language long (bear carpet → beards)") {
    Expect.value(MicroBlog.truncate("Bärteppich")).toEqual("Bärte")
  }

  skip.test("Bulgarian language short (good)") {
    Expect.value(MicroBlog.truncate("Добър")).toEqual("Добър")
  }

  skip.test("Greek language short (health)") {
    Expect.value(MicroBlog.truncate("υγειά")).toEqual("υγειά")
  }

  skip.test("Maths short") {
    Expect.value(MicroBlog.truncate("a=πr²")).toEqual("a=πr²")
  }

  skip.test("Maths long") {
    Expect.value(MicroBlog.truncate("∅⊊ℕ⊊ℤ⊊ℚ⊊ℝ⊊ℂ")).toEqual("∅⊊ℕ⊊ℤ")
  }

  skip.test("English and emoji short") {
    Expect.value(MicroBlog.truncate("Fly 🛫")).toEqual("Fly 🛫")
  }

  skip.test("Emoji short") {
    Expect.value(MicroBlog.truncate("💇")).toEqual("💇")
  }

  skip.test("Emoji long") {
    Expect.value(MicroBlog.truncate("❄🌡🤧🤒🏥🕰😀")).toEqual("❄🌡🤧🤒🏥")
  }

  skip.test("Royal Flush?") {
    Expect.value(MicroBlog.truncate("🃎🂸🃅🃋🃍🃁🃊")).toEqual("🃎🂸🃅🃋🃍")
  }
}
