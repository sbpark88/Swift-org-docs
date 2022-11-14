import Foundation

// 1. For-In Loops
let numbers: [Int] = [2, 5, 3, 9, 11, 14]

for number in numbers {
    number.isMultiple(of: 2) ? print("\(number) is even") : print("\(number) is odd")
}


print("-----------------------------------------")
// 2. forEach
numbers.forEach { $0.isMultiple(of: 2) ? print("\($0) is even") : print("\($0) is odd") }


print("-----------------------------------------")
// 3. forEach with `continue` or `break`
let anotherNumbers: [Int?] = [2, 5, nil, 9, 11, nil, 6, nil, 14]

for number in anotherNumbers {
    guard let number = number else {
        print("Found nil")
        //        continue
        break
    }
    print("The double of \(number) is \(number * 2)")
}


print("-----------------------------------------")
// 4. forEach with `return`
anotherNumbers.forEach { number in
    guard let number = number else {
        print("Found nil")
        return
    }
    print("The double of \(number) is \(number * 2)")
}
