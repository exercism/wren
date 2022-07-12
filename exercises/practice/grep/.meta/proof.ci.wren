import "io" for File
import "essentials" for Strings

class Grep {
  static grep(pattern, files) { grep(pattern, files, []) }

  static grep(pattern, files, flags) {
    var grepper = this.new(pattern, flags)
    return grepper.scan(files)
  }

  construct new(pattern, flags) {
    _isInsensitive = flags.contains("-i")
    _isInverse     = flags.contains("-v")
    _isWholeLine   = flags.contains("-x")
    _lineNumbers   = flags.contains("-n")
    _onlyFilenames = flags.contains("-l")
    _pattern = _isInsensitive ? Strings.downcase(pattern) : pattern
  }

  toString {
    return "%(type)(%(_pattern), %({
      "isInsensitive": _isInsensitive,
      "isInverse": _isInverse,
      "isWholeLine": _isWholeLine,
      "lineNumbers": _lineNumbers,
      "onlyFilenames": _onlyFilenames,
    }))"
  }

  scan(files) {
    var output = []
    for (file in files) {
      if (File.exists(file)) {
        output.addAll(scanFile_(file, files.count))
      }
    }
    return output
  }

  scanFile_(file, numFiles) {
    var output = []
    var lineNum = 0
    for (line in Files.lines(file)) {
      lineNum = lineNum + 1
      var cmpLine = _isInsensitive ? Strings.downcase(line) : line
      if (isMatch_(cmpLine)) {
        if (_onlyFilenames) {
          output.add(file)
          break
        }
        var prefix = ""
        if (numFiles > 1) prefix = prefix + "%(file):"
        if (_lineNumbers) prefix = prefix + "%(lineNum):"
        output.add(prefix + line)
      }
    }
    return output
  }

  isMatch_(cmpLine) {
    var isMatch = _isWholeLine ? cmpLine == _pattern : cmpLine.contains(_pattern)
    return Bools.xor(isMatch, _isInverse)
  }
}

// ------------------------------------------------------------
// some utility classes
// ------------------------------------------------------------

class Bools {
  static xor(a, b) { (!a && b) || (a && !b) }
}

class Files {
  static lines(file) {
    var contents = File.read(file)
    // Remove the trailing newline to avoid the list of lines ending
    // with a spurious empty string.  I don't want to use trimEnd("\n")
    // because I only want to remove a single newline.
    if (contents.endsWith("\n")) contents = contents[0..-2]
    return contents.split("\n")
  }
}
