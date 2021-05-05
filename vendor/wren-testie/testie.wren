import "../wren-assert/Assert" for Assert
import "random" for Random
var RND = Random.new()
var SAD_EMOJI = ["😡","👺","👿","🙀","💩","😰","😤","😬"]


class Testie {
    construct new(name, fn) {
        _shoulds = []
        _skips = []
        _name = name
        _fails = 0
        fn.call(this, Skipper.new(this))
    }

    test(name, fn) { _shoulds.add([name, fn]) }
    should(name, fn) { test(name,fn) }
    skip(name, fn) { _skips.add([name,fn]) }
    reporter=(v){ _reporter = v }
    reporter { _reporter || Reporter }
    static test(name, fn) { Testie.new(name,fn).run() }
    describe(name, fn) { fn.call() }
    run() {
        var r = reporter.new(_name)
        r.start()

        for (test in _shoulds) {
            var name = test[0]
            var fn = test[1]
            var fiber = Fiber.new(fn)
            fiber.try()
            if (fiber.error) {
                _fails = _fails + 1
                r.fail(name, fiber.error)
            } else {
                r.success(name)
            }
        }
        for (test in _skips) {
            var name = test[0]
            r.skip(name)
        }
        r.done()
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


        return true
    }
    abortsWith(err) {
        var f = Fiber.new { _value.call() }
        var result = f.try()
        if (result!=err) {
            Fiber.abort("Expected error '%(err)' but got none")
        }
    }
    toBe(v) {
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

class Reporter {
    construct new(name) {
        _name = name
        _fail = _skip = _success = 0
    }
    start() { System.print(_name + "\n") }
    skip(name) {
        _skip = _skip + 1
        System.print("  🔹 [skip] %(name)")
    }
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

