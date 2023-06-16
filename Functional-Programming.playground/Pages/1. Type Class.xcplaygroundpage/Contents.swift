import Foundation

// MARK: Without Type Class
func fourTimes(value: Int?) -> Int? {
    guard let value else { return nil }
    return value * 4
}

let result1 = fourTimes(value: 23)
let result2 = fourTimes(value: nil)

print(result1)  // Optional(92)
print(result2)  // nil


// MARK: With Type Class(in this case, Optional Monad)
func fiveTimes(value: Int) -> Int {
    value * 5
}

let result3 = Optional(23).map(fiveTimes(value:))
let result4 = Optional(nil).map { fiveTimes(value: $0) }

print(result3)  // Optional(115)
print(result4)  // nil
