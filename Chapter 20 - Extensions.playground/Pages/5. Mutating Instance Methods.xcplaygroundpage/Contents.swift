import Foundation

var someDouble: Double = 3.342

let rounded = someDouble.rounded()
print(rounded)          // 3
print(someDouble)       // 3.342

someDouble.round()
print(someDouble)       // 3


extension Int {
    func squared() -> Self {
        self * self
    }
    mutating func square() {
        self = self * self
    }
}

var someInt: Int = 3

let squared = someInt.squared()
print(squared)          // 9
print(someInt)          // 3

someInt.square()
print(someInt)          // 9
