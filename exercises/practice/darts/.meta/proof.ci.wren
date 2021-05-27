// export const score = (x, y) => {
//   // Check for NaN
//   if (Number.isNaN(Number(x)) || Number.isNaN(Number(y))) return null;

//   // Use euclidean distance
//   const distanceToDart = Math.sqrt(x * x + y * y);

//   // Define points for each section of the target
//   if (distanceToDart > 10) return 0;
//   if (distanceToDart > 5) return 1;
//   if (distanceToDart > 1) return 5;
//   return 10;
// };

var DISTANCE_to_SCORE = [
  // 1 or less is 10 points, etc.
  { "distance": 1, "score": 10},
  { "distance": 5, "score": 5},
  { "distance": 10, "score": 1},
  { "distance": Num.infinity, "score": 0}
]

class Darts {
  static score(x,y) {
    var distance = (x*x+y*y).sqrt
    for (entry in DISTANCE_to_SCORE) {
      if (distance <= entry["distance"]) return entry["score"]
    }
    Fiber.abort("impossible score")
  }
}