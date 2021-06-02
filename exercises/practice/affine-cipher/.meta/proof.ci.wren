// const ALPHABET = 'abcdefghijklmnopqrstuvwxyz';
// const ALPHABET_LENGTH = ALPHABET.length;

// const areCoprimes = (a, b) => {
//   for (let i = Math.min(a, b); i > 1; i--) {
//     if (a % i === 0 && b % i === 0) {
//       return false;
//     }
//   }

//   return true;
// };

// const checkCoprime = (a, b) => {
//   if (!areCoprimes(a, b)) {
//     throw new Error('a and m must be coprime.');
//   }
// };

// const isNumber = (candidate) => {
//   return !isNaN(Number(candidate));
// };

// const findMMI = (a) => {
//   let i = 1;

//   // eslint-disable-next-line no-constant-condition
//   while (true) {
//     i++;

//     if ((a * i - 1) % ALPHABET_LENGTH === 0) {
//       return i;
//     }
//   }
// };

// const positiveModulo = (a, b) => {
//   return ((a % b) + b) % b;
// };

// const groupBy = (elements, groupLength) => {
//   const result = [[]];
//   let i = 0;

//   elements.forEach((el) => {
//     if (result[i] && result[i].length < groupLength) {
//       result[i].push(el);
//     } else {
//       i++;
//       result[i] = [el];
//     }
//   });

//   return result;
// };

// export const encode = (phrase, { a, b }) => {
//   checkCoprime(a, ALPHABET_LENGTH);

//   let encodedText = '';

//   phrase
//     .toLowerCase()
//     .split('')
//     .filter((char) => char !== ' ')
//     .forEach((char) => {
//       if (ALPHABET.includes(char)) {
//         const x = ALPHABET.indexOf(char);
//         const encodedIndex = (a * x + b) % ALPHABET_LENGTH;

//         encodedText += ALPHABET[encodedIndex];
//       } else if (isNumber(char)) {
//         encodedText += char;
//       }
//     });

//   return groupBy(encodedText.split(''), 5)
//     .map((group) => group.join(''))
//     .join(' ');
// };

// export const decode = (phrase, { a, b }) => {
//   checkCoprime(a, ALPHABET_LENGTH);

//   const mmi = findMMI(a);

//   return phrase
//     .split('')
//     .filter((char) => char !== ' ')
//     .map((char) => {
//       if (isNumber(char)) {
//         return char;
//       }

//       const y = ALPHABET.indexOf(char);
//       const decodedIndex = positiveModulo(mmi * (y - b), ALPHABET_LENGTH);

//       return ALPHABET[decodedIndex];
//     })
//     .join('');
// };

var NUMBERS = "0123456789"

class Strings {
    static downcase(s) {
        return s.bytes.map { |x|
            if ((65..90).contains(x)) x = x + 32
            return String.fromByte(x)
        }.join("")
    }
    static isNumber(s) { NUMBERS.contains(s) }
}

class Maths {
  static areCoprimes(a,b) {
    var min = a.min(b)

    for (i in min...1) {
      if (a % i == 0 && b % i == 0) {
        return false
      }
    }
    return true
  }

  static positiveModulo(a,b) {
    return ((a % b) + b) % b
  }
  static findMMI(a, m) {
    var i = 1

    while (true) {
      i = i + 1

      if ((a * i - 1) % m == 0) {
        return i
      }
    }
  }
}

var ALPHABET = "abcdefghijklmnopqrstuvwxyz"

class AffineCipher {
  static guaranteeCoprime(a,m) {
    if (!Maths.areCoprimes(a, m)) {
      Fiber.abort("a and m must be coprime.")
    }
  }
  static transformChar(char, fn) {
      if (Strings.isNumber(char)) return char
      var x = ALPHABET.indexOf(char)
      if (x == -1) return null

      return ALPHABET[fn.call(x)]
  }
  static encode(text, opts) {
    var i = 0
    var a = opts["a"]
    var b = opts["b"]
    guaranteeCoprime(a, ALPHABET.count)

    var out = ""
    for (char in Strings.downcase(text)) {
      // `E(x) = (ax + b) mod m`
      var e = transformChar(char) { |x| ((a*x) + b) % ALPHABET.count }
      if (e == null) continue

      out = out + e
      i = i + 1
      if (i % 5 == 0) out = out + " "
    }
    return out.trim()
  }
  static decode(text, opts) {
    var a = opts["a"]
    var b = opts["b"]
    guaranteeCoprime(a, ALPHABET.count)

    var mmi = Maths.findMMI(a, ALPHABET.count)

    var out = ""
    for (char in Strings.downcase(text)) {
      var e = transformChar(char) { |x| Maths.positiveModulo(mmi * (x - b), ALPHABET.count) }
      if (e == null) continue

      out = out + e
    }
    return out
  }
}