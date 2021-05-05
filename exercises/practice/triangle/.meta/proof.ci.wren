class Triangle {
  construct new(a, b, c) {
    _sides = [a, b, c]
    _s1 = a
    _s2 = b
    _s3 = c
  }

  isValid { sidesPositive && validatesTriangleInequality }
  sidesPositive { _s1 > 0 && _s2 > 0 && _s3 > 0 }
  validatesTriangleInequality { _s1 + _s2 >= _s3 && _s1 + _s3 >= _s2 && _s2 + _s3 >= _s1 }

  isEquilateral {
    if (!isValid) return false

    return _s1 == _s2 && _s2 == _s3 && _s1 == _s3
  }

  isIsosceles {
    if (!isValid) return false

    return _s1 == _s2 || _s1 == _s3 || _s2 == _s3
  }

  isScalene {
    if (!isValid) return false

    return !isIsosceles
  }
}
