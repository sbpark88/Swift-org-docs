import Foundation

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
let anotherIncrementByTen = makeIncrementer(forIncrement: 10)
let referToIncrementByTen = incrementByTen

print(incrementByTen())         // 10
print(incrementByTen())         // 20
print(incrementByTen())         // 30

print(anotherIncrementByTen())  // 10

print(referToIncrementByTen())  // 40
print(incrementByTen())         // 50
