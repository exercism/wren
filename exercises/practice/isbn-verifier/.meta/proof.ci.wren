// export const isValid = (isbn) => {
//   isbn = isbn.replace(/-/g, '');

//   const isbnFormat = /^[0-9]{9}(X|\d)$/g;
//   if (!isbnFormat.test(isbn)) {
//     return false;
//   }

//   const isbnLength = 10;
//   const sumOfProducts = [...isbn]
//     .map((digit) => (digit === 'X' ? 10 : Number(digit)))
//     .map((digit, index) => digit * (isbnLength - index))
//     .reduce((sum, value) => sum + value, 0);
//   return sumOfProducts % 11 === 0;
// };

var VALID_CHARS = "0123456789"
var CHECK = "X"

class ISBN {
  static length { 10 }
  construct new(str) {
    _str = str.replace("-","")
  }
  digits_ { _str.map { |c| c == "X" ? 10 : Num.fromString(c) }.toList }
  sumOfProducts_ {
    var digits = digits_
    return (0...ISBN.length).
      map { |i| digits[i] * (ISBN.length - i) }.
      reduce(0) { |acc, n| acc + n }
  }
  properNumberDigits_ { _str.count == ISBN.length }
  validDigits_ {
    // first 9 digits numeric
    return _str[0..-2].all { |c| VALID_CHARS.contains(c) } &&
      // last digt numeric or CHECK digit
      (VALID_CHARS+CHECK).contains(_str[-1])
  }
  isValid { properNumberDigits_ && validDigits_ && sumOfProducts_ % 11 == 0 }
}