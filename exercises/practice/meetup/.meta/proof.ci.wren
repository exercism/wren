var MONTHS = [
  null,
  "January",
  "February",
  "March",
  "April",
  "May",
  "June",
  "July",
  "August",
  "September",
  "October",
  "November",
  "December",
]

var WEEKDAYS = [
  "Monday",
  "Tuesday",
  "Wednesday",
  "Thursday",
  "Friday",
  "Saturday",
  "Sunday",
]

class Meetup {
  static date(description) {
    var words = description.split(" ")
    var year = Num.fromString(words[5])
    var month = MONTHS.indexOf(words[4])
    var required_weekday = WEEKDAYS.indexOf(words[2])
    var week = words[1]

    var concluding_day = endOfWeek(year, month, week)
    var concluding_weekday = calculateWeekday(year, month, concluding_day)

    var adjustment = 0
    if (concluding_weekday < required_weekday) {
      adjustment = 7
    }
    var required_day = concluding_day + required_weekday - (concluding_weekday + adjustment)

    return "%(MONTHS[month]) %(required_day), %(year)"
  }

  static isLeap(year) {
    return (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0))
  }

  static daysInMonth(year, month) {
    var DAYS_IN_MONTH = [
      null,
      31,
      null,
      31,
      30,
      31,
      30,
      31,
      31,
      30,
      31,
      30,
      31,
    ]
    if (month == 2) {
      if (isLeap(year)) {
        return 29
      }
      return 28
    }
    return DAYS_IN_MONTH[month]
  }

  static endOfWeek(year, month, week) {
    if (week == "first") {
      return 7
    }
    if (week == "second") {
      return 14
    }
    if (week == "third") {
      return 21
    }
    if (week == "fourth") {
      return 28
    }
    if (week == "teenth") {
      return 19
    }
    if (week == "last") {
      return daysInMonth(year, month)
    }
    return -1
  }

  static monthOffset(month) {
    // offset from the end of February
    var OFFSETS = [
      null,
      307, // offset from the end of February of previous year
      338,
      1,
      32,
      62,
      93,
      123,
      154,
      185,
      215,
      246,
      276,
    ]
    return OFFSETS[month]
  }

  static quotient(dividend, divisor) {
    var remainder = dividend % divisor
    return (dividend - remainder) / divisor
  }

  static calculateWeekday(year, month, day) {
    if (month <= 2) {
      year = year - 1
    }
    return (year + quotient(year, 4) - quotient(year, 100) + quotient(year, 400) + monthOffset(month) + day) % 7
  }
}
