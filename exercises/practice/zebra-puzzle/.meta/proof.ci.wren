class ZebraPuzzle {
  construct new() {
    _waterDrinker = ""
    _zebraOwner = ""
    solve
  }

  drinksWater { _waterDrinker }
  ownsZebra { _zebraOwner }

  rightOf(a, b) { a + 1 == b }
  nextTo(a, b) { rightOf(a, b) || rightOf(b, a) }

  solve {
    var HOUSES = [1,2,3,4,5]
    var FIRST = 1
    var MIDDLE = 3

    var permutations = [
      [1,2,3,4,5], [1,2,3,5,4], [1,2,4,3,5], [1,2,4,5,3], [1,2,5,3,4], [1,2,5,4,3],
      [1,3,2,4,5], [1,3,2,5,4], [1,3,4,2,5], [1,3,4,5,2], [1,3,5,2,4], [1,3,5,4,2],
      [1,4,2,3,5], [1,4,2,5,3], [1,4,3,2,5], [1,4,3,5,2], [1,4,5,2,3], [1,4,5,3,2],
      [1,5,2,3,4], [1,5,2,4,3], [1,5,3,2,4], [1,5,3,4,2], [1,5,4,2,3], [1,5,4,3,2],
      [2,1,3,4,5], [2,1,3,5,4], [2,1,4,3,5], [2,1,4,5,3], [2,1,5,3,4], [2,1,5,4,3],
      [2,3,1,4,5], [2,3,1,5,4], [2,3,4,1,5], [2,3,4,5,1], [2,3,5,1,4], [2,3,5,4,1],
      [2,4,1,3,5], [2,4,1,5,3], [2,4,3,1,5], [2,4,3,5,1], [2,4,5,1,3], [2,4,5,3,1],
      [2,5,1,3,4], [2,5,1,4,3], [2,5,3,1,4], [2,5,3,4,1], [2,5,4,1,3], [2,5,4,3,1],
      [3,1,2,4,5], [3,1,2,5,4], [3,1,4,2,5], [3,1,4,5,2], [3,1,5,2,4], [3,1,5,4,2],
      [3,2,1,4,5], [3,2,1,5,4], [3,2,4,1,5], [3,2,4,5,1], [3,2,5,1,4], [3,2,5,4,1],
      [3,4,1,2,5], [3,4,1,5,2], [3,4,2,1,5], [3,4,2,5,1], [3,4,5,1,2], [3,4,5,2,1],
      [3,5,1,2,4], [3,5,1,4,2], [3,5,2,1,4], [3,5,2,4,1], [3,5,4,1,2], [3,5,4,2,1],
      [4,1,2,3,5], [4,1,2,5,3], [4,1,3,2,5], [4,1,3,5,2], [4,1,5,2,3], [4,1,5,3,2],
      [4,2,1,3,5], [4,2,1,5,3], [4,2,3,1,5], [4,2,3,5,1], [4,2,5,1,3], [4,2,5,3,1],
      [4,3,1,2,5], [4,3,1,5,2], [4,3,2,1,5], [4,3,2,5,1], [4,3,5,1,2], [4,3,5,2,1],
      [4,5,1,2,3], [4,5,1,3,2], [4,5,2,1,3], [4,5,2,3,1], [4,5,3,1,2], [4,5,3,2,1],
      [5,1,2,3,4], [5,1,2,4,3], [5,1,3,2,4], [5,1,3,4,2], [5,1,4,2,3], [5,1,4,3,2],
      [5,2,1,3,4], [5,2,1,4,3], [5,2,3,1,4], [5,2,3,4,1], [5,2,4,1,3], [5,2,4,3,1],
      [5,3,1,2,4], [5,3,1,4,2], [5,3,2,1,4], [5,3,2,4,1], [5,3,4,1,2], [5,3,4,2,1],
      [5,4,1,2,3], [5,4,1,3,2], [5,4,2,1,3], [5,4,2,3,1], [5,4,3,1,2], [5,4,3,2,1]
    ]

    for (colours in permutations) {
      var blue = colours[0]
      var green = colours[1]
      var ivory = colours[2]
      var red = colours[3]
      var yellow = colours[4]

      if (rightOf(green, ivory)) {

        for (nations in permutations) {
          var en = nations[0]
          var es = nations[1]
          var ja = nations[2]
          var no = nations[3]
          var uk = nations[4]

          var nationalities = ["","","","","",""]
          nationalities[en] = "English"
          nationalities[es] = "Spanish"
          nationalities[ja] = "Japanese"
          nationalities[no] = "Norwegian"
          nationalities[uk] = "Ukrainian"

          if (en == red && no == FIRST && nextTo(no, blue)) {

            for (drinks in permutations) {
              var coffee = drinks[0]
              var tea = drinks[1]
              var milk = drinks[2]
              var juice = drinks[3]
              var water = drinks[4]

              if (coffee == green && uk == tea && milk == MIDDLE) {

                for (hobbies in permutations) {
                  var dance = hobbies[0]
                  var paint = hobbies[1]
                  var read = hobbies[2]
                  var chess = hobbies[3]
                  var football = hobbies[4]

                  if (paint == yellow && football == juice && ja == chess) {

                    for (pets in permutations) {
                      var horse = pets[0]
                      var fox = pets[1]
                      var snail = pets[2]
                      var dog = pets[3]
                      var zebra = pets[4]

                      if (es == dog && dance == snail && nextTo(read, fox) && nextTo(paint, horse)) {

                        _waterDrinker = nationalities[water]
                        _zebraOwner = nationalities[zebra]
                        return
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}
