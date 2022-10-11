import Foundation

// 1. Iterate over with numeric ranges.

for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}
// 1 times 5 is 5
// 2 times 5 is 10
// 3 times 5 is 15
// 4 times 5 is 20
// 5 times 5 is 25


// If you don't need each value from a sequence, use an underscore.

let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")
// Prints "3 to the power of 10 is 59049"

// You can iterate over more complex by stride.
let sequence = stride(from: 0, to: 60, by: 5)
print(type(of: sequence))   // StrideTo<Int>

for tickMark in stride(from: 0, to: 60, by: 5) {
    print(tickMark, terminator: " ")    // 0 5 10 15 20 25 30 35 40 45 50 55 
}
print("")

// 2. For-In loop to iterate over the items in an array.

let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)!")
}
// Hello, Anna!
// Hello, Alex!
// Hello, Brian!
// Hello, Jack!


// 3. Iterate over a dictionary to access its key-value paris.

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}

// cats have 4 legs
// ants have 6 legs
// spiders have 8 legs

