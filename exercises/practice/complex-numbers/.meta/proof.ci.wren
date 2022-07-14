class ComplexNumber {
  construct new(real, imaginary) {
    _real = real
    _imag = imaginary
  }

  real { _real }
  imag { _imag }

  ==(other) { type == other.type && real == other.real && imag == other.imag }

  toComplex(other) { type == other.type ? other : type.new(other, 0) }

  +(other) {
    other = toComplex(other)
    return type.new(real + other.real, imag + other.imag)
  }

  -(other) {
    other = toComplex(other)
    return type.new(real - other.real, imag - other.imag)
  }

  *(other) {
    other = toComplex(other)
    var r = real * other.real - imag * other.imag
    var i = imag * other.real + real * other.imag
    return type.new(r, i)
  }

  /(other) {
    other = toComplex(other)
    var denom = other.real.pow(2) + other.imag.pow(2)
    var r = (real * other.real + imag * other.imag) / denom
    var i = (imag * other.real - real * other.imag) / denom
    return type.new(r, i)
  }

  abs { (real.pow(2) + imag.pow(2)).sqrt }

  conj { type.new(real, -imag) }

  exp {
    var x = type.new(1.exp.pow(real), 0)
    var y = type.new(imag.cos, imag.sin)
    return x * y
  }
}
