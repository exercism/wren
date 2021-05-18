class BufferEmptyError {
  static error { "buffer empty" }
}
class BufferFullError {
  static error { "buffer full" }
}

class CircularBuffer {
  construct new(size) {
    _max = size
    _buffer = List.filled(_max, null)
    clear()
  }
  isEmpty { _count == 0 }
  isFull { _count == _max }
  read() {
    if (isEmpty) Fiber.abort(BufferEmptyError)

    var v = _buffer[_readCursor]
    _readCursor = (_readCursor + 1) % _max
    _count = _count - 1
    return v
  }

  write(value) {
    if (isFull) Fiber.abort(BufferFullError)

    _buffer[_writeCursor] = value
    _writeCursor = (_writeCursor + 1) % _max
    _count = _count + 1
  }

  forceWrite(value) {
    if (isFull) read()
    write(value)
  }

  clear() { _count = _readCursor = _writeCursor = 0 }
}
