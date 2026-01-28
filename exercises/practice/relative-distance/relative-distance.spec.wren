import "./relative-distance" for RelativeDistance
import "wren-testie/testie" for Testie, Expect

Testie.test("RelativeDistance") { |do, skip|
  skip.test("Direct parent-child relation") {
    var familyTree = {
      "Vera": ["Tomoko"],
      "Tomoko": ["Aditi"]
    }
    var relativeDistance = RelativeDistance.new(familyTree)
    Expect.value(relativeDistance.degreeOfSeparation("Vera", "Tomoko")).toEqual(1)
  }

  skip.test("Sibling relationship") {
    var familyTree = {
      "Dalia": ["Olga", "Yassin"]
    }
    var relativeDistance = RelativeDistance.new(familyTree)
    Expect.value(relativeDistance.degreeOfSeparation("Olga", "Yassin")).toEqual(1)
  }

  skip.test("Two degrees of separation, grandchild") {
    var familyTree = {
      "Khadija": ["Mateo"],
      "Mateo": ["Rami"]
    }
    var relativeDistance = RelativeDistance.new(familyTree)
    Expect.value(relativeDistance.degreeOfSeparation("Khadija", "Rami")).toEqual(2)
  }

  skip.test("Unrelated individuals") {
    var familyTree = {
      "Priya": ["Rami"],
      "Kaito": ["Elif"]
    }
    var relativeDistance = RelativeDistance.new(familyTree)
    Expect.value(relativeDistance.degreeOfSeparation("Priya", "Kaito")).toEqual(null)
  }

  skip.test("Complex graph, cousins") {
    var familyTree = {
      "Aiko": ["Bao", "Carlos"],
      "Bao": ["Dalia", "Elias"],
      "Carlos": ["Fatima", "Gustavo"],
      "Dalia": ["Hassan", "Isla"],
      "Elias": ["Javier"],
      "Fatima": ["Khadija", "Liam"],
      "Gustavo": ["Mina"],
      "Hassan": ["Noah", "Olga"],
      "Isla": ["Pedro"],
      "Javier": ["Quynh", "Ravi"],
      "Khadija": ["Sofia"],
      "Liam": ["Tariq", "Uma"],
      "Mina": ["Viktor", "Wang"],
      "Noah": ["Xiomara"],
      "Olga": ["Yuki"],
      "Pedro": ["Zane", "Aditi"],
      "Quynh": ["Boris"],
      "Ravi": ["Celine"],
      "Sofia": ["Diego", "Elif"],
      "Tariq": ["Farah"],
      "Uma": ["Giorgio"],
      "Viktor": ["Hana", "Ian"],
      "Wang": ["Jing"],
      "Xiomara": ["Kaito"],
      "Yuki": ["Leila"],
      "Zane": ["Mateo"],
      "Aditi": ["Nia"],
      "Boris": ["Oscar"],
      "Celine": ["Priya"],
      "Diego": ["Qi"],
      "Elif": ["Rami"],
      "Farah": ["Sven"],
      "Giorgio": ["Tomoko"],
      "Hana": ["Umar"],
      "Ian": ["Vera"],
      "Jing": ["Wyatt"],
      "Kaito": ["Xia"],
      "Leila": ["Yassin"],
      "Mateo": ["Zara"],
      "Nia": ["Antonio"],
      "Oscar": ["Bianca"],
      "Celine": ["Priya"],
      "Priya": ["Cai"],
      "Diego": ["Qi"],
      "Qi": ["Dimitri"],
      "Elif": ["Rami"],
      "Rami": ["Ewa"],
      "Farah": ["Sven"],
      "Sven": ["Fabio"],
      "Giorgio": ["Tomoko"],
      "Tomoko": ["Gabriela"],
      "Hana": ["Umar"],
      "Umar": ["Helena"],
      "Ian": ["Vera"],
      "Vera": ["Igor"],
      "Jing": ["Wyatt"],
      "Wyatt": ["Jun"],
      "Kaito": ["Xia"],
      "Xia": ["Kim"],
      "Leila": ["Yassin"],
      "Yassin": ["Lucia"],
      "Mateo": ["Zara"],
      "Zara": ["Mohammed"]
    }
    var relativeDistance = RelativeDistance.new(familyTree)
    Expect.value(relativeDistance.degreeOfSeparation("Dimitri", "Fabio")).toEqual(9)
  }

  skip.test("Complex graph, no shortcut, far removed nephew") {
    var familyTree = {
      "Aiko": ["Bao", "Carlos"],
      "Bao": ["Dalia", "Elias"],
      "Carlos": ["Fatima", "Gustavo"],
      "Dalia": ["Hassan", "Isla"],
      "Elias": ["Javier"],
      "Fatima": ["Khadija", "Liam"],
      "Gustavo": ["Mina"],
      "Hassan": ["Noah", "Olga"],
      "Isla": ["Pedro"],
      "Javier": ["Quynh", "Ravi"],
      "Khadija": ["Sofia"],
      "Liam": ["Tariq", "Uma"],
      "Mina": ["Viktor", "Wang"],
      "Noah": ["Xiomara"],
      "Olga": ["Yuki"],
      "Pedro": ["Zane", "Aditi"],
      "Quynh": ["Boris"],
      "Ravi": ["Celine"],
      "Sofia": ["Diego", "Elif"],
      "Tariq": ["Farah"],
      "Uma": ["Giorgio"],
      "Viktor": ["Hana", "Ian"],
      "Wang": ["Jing"],
      "Xiomara": ["Kaito"],
      "Yuki": ["Leila"],
      "Zane": ["Mateo"],
      "Aditi": ["Nia"],
      "Boris": ["Oscar"],
      "Celine": ["Priya"],
      "Diego": ["Qi"],
      "Elif": ["Rami"],
      "Farah": ["Sven"],
      "Giorgio": ["Tomoko"],
      "Hana": ["Umar"],
      "Ian": ["Vera"],
      "Jing": ["Wyatt"],
      "Kaito": ["Xia"],
      "Leila": ["Yassin"],
      "Mateo": ["Zara"],
      "Nia": ["Antonio"],
      "Oscar": ["Bianca"],
      "Priya": ["Cai"],
      "Qi": ["Dimitri"],
      "Rami": ["Ewa"],
      "Sven": ["Fabio"],
      "Tomoko": ["Gabriela"],
      "Umar": ["Helena"],
      "Vera": ["Igor"],
      "Wyatt": ["Jun"],
      "Xia": ["Kim"],
      "Yassin": ["Lucia"],
      "Zara": ["Mohammed"]
    }
    var relativeDistance = RelativeDistance.new(familyTree)
    Expect.value(relativeDistance.degreeOfSeparation("Lucia", "Jun")).toEqual(14)
  }

  skip.test("Complex graph, several times removed") {
    var familyTree = {
      "Aiko": ["Bao", "Carlos"],
      "Bao": ["Dalia"],
      "Carlos": ["Fatima", "Gustavo"],
      "Dalia": ["Hassan", "Isla"],
      "Fatima": ["Khadija", "Liam"],
      "Gustavo": ["Mina"],
      "Hassan": ["Noah", "Olga"],
      "Isla": ["Pedro"],
      "Javier": ["Quynh", "Ravi"],
      "Khadija": ["Sofia"],
      "Liam": ["Tariq", "Uma"],
      "Mina": ["Viktor", "Wang"],
      "Noah": ["Xiomara"],
      "Olga": ["Yuki"],
      "Pedro": ["Zane", "Aditi"],
      "Quynh": ["Boris"],
      "Ravi": ["Celine"],
      "Sofia": ["Diego", "Elif"],
      "Tariq": ["Farah"],
      "Uma": ["Giorgio"],
      "Viktor": ["Hana", "Ian"],
      "Wang": ["Jing"],
      "Xiomara": ["Kaito"],
      "Yuki": ["Leila"],
      "Zane": ["Mateo"],
      "Aditi": ["Nia"],
      "Boris": ["Oscar"],
      "Celine": ["Priya"],
      "Diego": ["Qi"],
      "Elif": ["Rami"],
      "Farah": ["Sven"],
      "Giorgio": ["Tomoko"],
      "Hana": ["Umar"],
      "Ian": ["Vera"],
      "Jing": ["Wyatt"],
      "Kaito": ["Xia"],
      "Leila": ["Yassin"],
      "Mateo": ["Zara"],
      "Nia": ["Antonio"],
      "Oscar": ["Bianca"],
      "Priya": ["Cai"],
      "Qi": ["Dimitri"],
      "Rami": ["Ewa"],
      "Sven": ["Fabio"],
      "Tomoko": ["Gabriela"],
      "Umar": ["Helena"],
      "Vera": ["Igor"],
      "Wyatt": ["Jun"],
      "Xia": ["Kim"],
      "Yassin": ["Lucia"],
      "Zara": ["Mohammed"]
    }
    var relativeDistance = RelativeDistance.new(familyTree)
    Expect.value(relativeDistance.degreeOfSeparation("Wyatt", "Xia")).toEqual(12)
  }
}
