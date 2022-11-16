import Foundation

let numbersWithNil: [Int?] = [5, 15, nil, 3, 9, 12, nil, nil, 17, nil]

// 1. Collection that stores `Optional` elements
//let doubledNums = numbersWithNil.map { $0 * 2 } // error: value of optional type 'Int?' must be unwrapped to a value of type 'Int'


// unwrapping
//let doubledNums = numbersWithNil.map { $0! * 2 } // Fatal error: Unexpectedly found nil while unwrapping an Optional value


// 'long version' of the Type-Safe code
//let doubledNums = numbersWithNil.map { (number) -> Int? in
//    guard let number = number else { return nil }
//    return number * 2
//}

// 'shorter version' of the Type-Safe code
let doubledNums = numbersWithNil.map { $0 != nil ? $0! * 2 : nil }
print(type(of: doubledNums))    // Array<Optional<Int>>
print(doubledNums)              // [Optional(10), Optional(30), nil, Optional(6), Optional(18), Optional(24), nil, nil, Optional(34), nil]


print("-----------------------------------------")
// 2. Using compactMap
let doubledNumsWithoutNil = numbersWithNil.compactMap { $0 != nil ? $0! * 2 : nil }
print(type(of: doubledNumsWithoutNil))  // Array<Int>
print(doubledNumsWithoutNil)            // [10, 30, 6, 18, 24, 34]


let anotherWay = numbersWithNil
    .filter { $0 != nil }
    .map { $0! * 2 }

print(type(of: anotherWay)) // Array<Int>
print(anotherWay)           // [10, 30, 6, 18, 24, 34]

print("-----------------------------------------")
// 3. default value
//let withDefaultValue = numbersWithNil.compactMap { $0 != nil ? $0! * 2 : -1 }
let withDefaultValue = numbersWithNil.map { $0 != nil ? $0! * 2 : -1 }
print(type(of: withDefaultValue))   // Array<Int>
print(withDefaultValue)             // [10, 30, -1, 6, 18, 24, -1, -1, 34, -1]


print("-----------------------------------------")
// 4. another usage
let coins = ["1", "5", "$", "10", "6"]

//var validCoins: [Int] = []
//
//for coin in coins {
//    guard let coin = Int(coin) else { continue }
//    validCoins.append(coin)
//}
//
//print(validCoins)   // [1, 5, 10, 6]


// compactMap
let validCoins = coins.compactMap { Int($0) }
print(validCoins)   // [1, 5, 10, 6]
