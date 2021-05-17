import "../wren-assert/Assert" for Assert
import "random" for Random
import "io" for Stdout
import "os" for Process
var RND = Random.new()
var SAD_EMOJI = ["😡","👺","👿","🙀","💩","😰","😤","😬"]

class Test {
    construct new(name, fn) {
        _name = name
        _fn = fn
        _skip = false
    }
    skip { _skip }
    name { _name }
    fn { _fn }
    skip() { _skip = true }
}

class Color {
  // Foreground color for ANSI white.
    static WHITE { "\u001b[37m" }
    static RESET { "\u001b[0m" }
    static BLACK { "\u001b[30m" }
    static BLACK_B { "\u001b[40m" }
    static BOLD { "\u001b[1m" }
}

class Testie {
    construct new(name, fn) {
        _tests = []
        _skips = []
        _name = name
        _fails = 0
        _afterEach = _beforeEach = Fn.new {}
        fn.call(this, Skipper.new(this))
    }
    static test(name, fn) { Testie.new(name,fn).run() }
    afterEach(fn) { _afterEach = fn }
    beforeEach(fn) { _beforeEach = fn }
    reporter=(v){ _reporter = v }
    reporter { _reporter || CuteReporter }

    // aliases
    should(name, fn) { test(name,fn) }
    describe(name, fn) { context(name,fn) }

    // core API
    test(name, fn) { _tests.add(Test.new(name, fn)) }
    skip(name, fn) { test(name,fn).skip() }
    context(name, fn) {
        _tests.add(name)
        fn.call()
    }
    run() {
        if (!(_tests[0] is String)) { _name = _name + "\n" }
        var r = reporter.new(_name)
        r.start()

        var i = 0
        var first_error
        for (test in _tests) {
            if (test is String) {
                r.section(test)
                continue
            }
            if (test.skip) {
                r.skip(test.name)
                continue
            }

            _beforeEach.call()
            var error = Fiber.new(test.fn).try()
            if (error) {
                if (first_error == null) first_error = i
                _fails = _fails + 1
                r.fail(test.name, error)
            } else {
                r.success(test.name)
            }
            _afterEach.call()
            i = i + 1
        }
        r.done()
        Stdout.flush()

        if (first_error) {
            var test = _tests[first_error]
            System.print(Color.BLACK + Color.BOLD + "--- TEST " + "-" * 66 + Color.RESET)
            System.print("%(test.name)\n")
            System.print(Color.BLACK + Color.BOLD + "--- STACKTRACE " + "-" * 60 + Color.RESET)
            Stdout.flush()
            Fiber.new(test.fn).call()
        }
        if (_fails > 0) Fiber.abort("Failing test")
    }
}

class Expect {
    construct new(value) {
        _value = value
    }
    static that(v) { Expect.new(v) }
    toEqual(v) { toBe(v) }
    equalMaps_(v) {
        if (_value.count != v.count) return false
        for (k in _value.keys) {
            if (_value[k] != v[k]) return false
        }
        return true
    }
    toIncludeSameItemsAs(v) {
        if (_value.count != v.count) return false
        for (item in _value) {
            if (!v.contains(item)) return false
        }
        return true
    }
    equalLists_(v) {
        if (_value.count != v.count) return false
        for (i in 0...v.count) {

            if (_value[i] != v[i]) {
                return false
            }
        }
        return true
    }
    abortsWith(err) {
        var f = Fiber.new { _value.call() }
        var result = f.try()
        if (result!=err) {
            Fiber.abort("Expected error '%(err)' but got none")
        }
    }
    toBeGreaterThanOrEqual(v) {
        if (_value >= v) return
        Fiber.abort("Expected %(v) to be greater than or equal to %(_value)")
    }
    toBeLessThanOrEqual(v) {
        if (_value <= v) return
        Fiber.abort("Expected %(v) to be less than or equal to %(_value)")
    }
    printValue(v) {
        if (v is String) {
            return "`%(v)`"
        } else if (v is List) {
            return "[" + v.map {|x| printValue(x) }.join(", ") +  "]"
        } else {
            return "%(v)"
        }
    }
    toBe(v) {
        if (_value is String || v is String) {
            if (_value == v) return

            var err=""
            err = err + "\nExpected:\n"
            err = err + printValue(v) + "\n"
            err = err + "\rReceived:\n"
            err = err + printValue(_value)
            Fiber.abort("%(err)\nShould match.")
        }
        if (_value is List && v is List) {
            if (!equalLists_(v)) {
                Fiber.abort("Expected list %(printValue(_value)) to be %(printValue(v))")
            }
            return
        }
        if (v is Map && _value is Map) {
            if (!equalMaps_(v)) {
                Fiber.abort("Expected %(_value) to be %(v)")
            }
            return
        }
        if (_value != v) {
            Fiber.abort("Expected %(_value) to be %(v)")
        }
    }
}

class CuteReporter {
    construct new(name) {
        _name = name
        _fail = _skip = _success = 0
    }
    start() { System.print(_name) }
    skip(name) {
        _skip = _skip + 1
        System.print("  🌀 [skip] %(name)")
    }
    section(name) { System.print("\n  %(name)\n") }
    fail(name, error) {
        _fail = _fail + 1
        System.print("  ❌ %(name) \n     %(error)\n")
    }
    success(name) {
        _success = _success + 1
        System.print("  ✅ %(name)")
    }
    sadEmotion { SAD_EMOJI[RND.int(SAD_EMOJI.count)] }
    done() {
        var overall = "💯"
        if (_fail > 0) overall = "❌ %(sadEmotion)"
        System.print("\n  %(overall) ✓ %(_success) successes, ✕ %(_fail) failures, ☐ %(_skip) skipped\n")
    }
}

class Skipper {
    construct new(that) {
        _that = that
    }
    test(a,b) { _that.skip(a,b) }
    should(a,b) { _that.skip(a,b) }
}

