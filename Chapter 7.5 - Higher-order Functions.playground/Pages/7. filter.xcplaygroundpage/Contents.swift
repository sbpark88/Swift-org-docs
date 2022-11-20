import Foundation

// 1. Filter some condition
let scores: [Int] = [100, 75, 80, 66, 93, 52, 96, 87, 72]
let graterThanOrEqualNinety: [Int] = scores.filter { $0 >= 90 }

print(graterThanOrEqualNinety)  // [100, 93, 96]


print("-----------------------------------------")
let words: [String] = ["room", "home", "train", "green", "hero"]

//var wordsWithO: [String] = []
//
//for word in words {
//    if word.contains("o") {
//        wordsWithO.append(word)
//    }
//}

//var temp: [String] = []
//
//for word in words {
//    if word.contains("o") {
//        temp.append(word)
//    }
//}
//
//let wordsWithO: [String] = temp

//let closure = {
//    var wordsWithO: [String] = []
//    for word in words {
//        if word.contains("o") {
//            wordsWithO.append(word)
//        }
//    }
//    return wordsWithO
//}
//
//let wordsWithO: [String] = closure()

//let wordsWithO: [String] = {
//    var wordsWithO: [String] = []
//    for word in words {
//        if word.contains("o") {
//            wordsWithO.append(word)
//        }
//    }
//    return wordsWithO
//}()

let wordsWithO: [String] = words.filter { $0.contains("o") }

print(wordsWithO)   // ["room", "home", "hero"]


print("-----------------------------------------")
// 2. Filter nil
let numbersWithNil = [1, 2, nil, 5, nil, 32, 7]

print(numbersWithNil.filter { $0 != nil })                   // [Optional(1), Optional(2), Optional(5), Optional(32), Optional(7)]
print(numbersWithNil.compactMap { $0 != nil ? $0 : nil })    // [1, 2, 5, 32, 7]
print(numbersWithNil.map { $0 != nil ? $0! : 0 })            // [1, 2, 0, 5, 0, 32, 7]


let sumWithFilter = numbersWithNil.lazy
    .filter { $0 != nil }
    .reduce(0) { $0 + $1! }

let sumWithCompactMap = numbersWithNil.lazy
    .compactMap { $0 != nil ? $0 : nil }
    .reduce(0) { $0 + $1 }

let sumWithMap = numbersWithNil.lazy
    .map { $0 != nil ? $0! : 0 }
    .reduce(0) { $0 + $1 }

let sumWithReduce = numbersWithNil.reduce(0) { $0 + ($1 ?? 0) }

print("sumWithFilter:       \(sumWithFilter)")
print("sumWithCompactMap:   \(sumWithCompactMap)")
print("sumWithMap:          \(sumWithMap)")
print("sumWithReduce:       \(sumWithReduce)")


print("-----------------------------------------")
// 3. Application of Filter

//class Tester {
//    var name: String
//    var age: Int
//
//    init(name: String, age: Int) {
//        self.name = name
//        self.age = age
//    }
//}

struct Tester {
    var name: String
    var age: Int
}

let testers: [Tester] = [Tester(name: "John", age: 23),
                         Tester(name: "Lucy", age: 25),
                         Tester(name: "Tom", age: 32),
                         Tester(name: "Mike", age: 29),
                         Tester(name: "Hellen", age: 19),
                         Tester(name: "Jim", age: 35),
                         Tester(name: "Jamie", age: 30)]

// name start "J" and age equal and over 30
let result: [Tester] = testers.filter { $0.name.prefix(1) == "J" && $0.age >= 30 }

result.forEach { print("\($0.name), \($0.age)") }
