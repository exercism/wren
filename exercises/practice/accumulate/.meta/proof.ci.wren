var Accumulate = Fn.new { |list, fn|
  var out = []
  for (item in list) {
    out.add(fn.call(item))
  }
  return out
}