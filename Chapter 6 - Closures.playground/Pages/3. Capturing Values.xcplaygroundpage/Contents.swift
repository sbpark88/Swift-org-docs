import Foundation

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByThree = makeIncrementer(forIncrement: 3)
let incrementByFive = makeIncrementer(forIncrement: 5)

print(incrementByThree())   // 3
print(incrementByThree())   // 6
print(incrementByThree())   // 9

print(incrementByFive())    // 5
print(incrementByFive())    // 10

print(incrementByThree())   // 12

print(incrementByFive())    // 15
