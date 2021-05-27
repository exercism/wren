// export const square = (num) => {
//   if (num < 1 || num > 64) {
//     throw new Error('square must be between 1 and 64');
//   }
//   return BigInt(2) ** BigInt(num - 1);
// };

// export const total = () => {
//   let result = BigInt(0);

//   for (let squareNum = 1; squareNum <= 64; squareNum++) {
//     result += square(squareNum);
//   }

//   return result;
// };

var SQUARES = (1..64)

class Grains {
  static square(n) {
    if (!SQUARES.contains(n)) Fiber.abort("square must be between 1 and 64")
    return 2.pow(n-1)
  }
  static total {
    return SQUARES.reduce(0) { |sum,n| sum + square(n) }
  }
}