import Foundation

// Ascending Order
// 1. For-In Loops
var numbers: [Int] = [5, 87, 2, 6, 15, 24, 8, 42, 74, 9, 32]

var swap: Bool = false

repeat {
    swap = false
    
    for i in 0..<numbers.count - 1 {
        if numbers[i] > numbers[i + 1] {
            let temp = numbers[i + 1]
            numbers[i + 1] = numbers[i]
            numbers[i] = temp
            swap = true
        }
    }
    
} while swap

print(numbers)  // [2, 5, 6, 8, 9, 15, 24, 32, 42, 74, 87]


print("-----------------------------------------")
// 2. sort
numbers = [5, 87, 2, 6, 15, 24, 8, 42, 74, 9, 32]
numbers.sort { $0 < $1 }
print(numbers)  // [2, 5, 6, 8, 9, 15, 24, 32, 42, 74, 87]


numbers = [5, 87, 2, 6, 15, 24, 8, 42, 74, 9, 32]
numbers.sort(by: <)
print(numbers)  // [2, 5, 6, 8, 9, 15, 24, 32, 42, 74, 87]


numbers = [5, 87, 2, 6, 15, 24, 8, 42, 74, 9, 32]
numbers.sort()
print(numbers)  // [2, 5, 6, 8, 9, 15, 24, 32, 42, 74, 87]


print("-----------------------------------------")
// 3. sorted
numbers = [5, 87, 2, 6, 15, 24, 8, 42, 74, 9, 32]
//let ascendingOrdered = numbers.sorted { $0 < $1 }
//print(ascendingOrdered) // [2, 5, 6, 8, 9, 15, 24, 32, 42, 74, 87]
//print(numbers)          // [5, 87, 2, 6, 15, 24, 8, 42, 74, 9, 32]


let ascendingOrdered = numbers.sorted()
print(ascendingOrdered) // [2, 5, 6, 8, 9, 15, 24, 32, 42, 74, 87]


print("-----------------------------------------")
// Descending Order
// 4. sort
numbers.sort(by: >)
print(numbers)  // [87, 74, 42, 32, 24, 15, 9, 8, 6, 5, 2]


print("-----------------------------------------")
// 5. sorted
numbers = [5, 87, 2, 6, 15, 24, 8, 42, 74, 9, 32]
let descendingOrdered = numbers.sorted(by: >)
print(descendingOrdered)    // [87, 74, 42, 32, 24, 15, 9, 8, 6, 5, 2]
