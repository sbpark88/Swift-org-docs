import Foundation

let words: [String] = ["room", "home", "train", "green", ""]

// 1. contains(_:)
// Check whether the array 'words' having "train"

print("-----------------------------------------")
// 1.1 For-In Loops
//let isIncluded: Bool = {
//    var isIncluded = false
//    for word in words {
//        if word == "train" {
//            isIncluded = true
//            break
//        }
//    }
//    return isIncluded
//}()
//
//print(isIncluded)   // true


// 1.2 OR Operator(||)
//let isIncluded: Bool = words[0] == "train" ||
//                       words[1] == "train" ||
//                       words[2] == "train" ||
//                       words[3] == "train" ||
//                       words[4] == "train"
//
//print(isIncluded)   // true


// 1.3 Switch
//let isIncluded: Bool = {
//    switch true {
//    case words[0] == "train": return true
//    case words[1] == "train": return true
//    case words[2] == "train": return true
//    case words[3] == "train": return true
//    case words[4] == "train": return true
//    default: return false
//    }
//}()

//let isIncluded: Bool = {
//    switch "train" {
//    case words[0], words[1], words[2], words[3], words[4]: return true
//    default: return false
//    }
//}()
//
//print(isIncluded)   // true


// 1.4 contains
//let isIncluded: Bool = words.contains { $0 == "train" }
//
//print(isIncluded)   // true
//
//print("The 'words' array \(isIncluded ? "contains" : "does not contains") the string 'train'.")


// 1.5 filter
//let isIncluded: Bool = words.filter { $0 == "train" }.count > 0 ? true : false
//
//print(isIncluded)   // true


print("-----------------------------------------")
// 2. contains(where:)
let isIncluded: Bool = words.contains { $0.contains("e") && $0.count >= 4 }
print(isIncluded)   // true


//let wordsWithO = words.filter { $0.contains("o") }
//print(wordsWithO)   // ["room", "home", ""]

let wordsWithO = words.filter { $0.contains("o") && $0.count >= 4 }
print(wordsWithO)   // ["heroe"]


print("-----------------------------------------")
// 2. With Dictionaroies
let temperatures = ["London": 7, "Athens": 14, "New York": 15, "Cairo": 19, "Sydney": 28]

let hasHighTemperatures = temperatures.contains { $0.value > 25 }
print(hasHighTemperatures)  // true


print("-----------------------------------------")
// 3. With Classes or Structures
//class Staff {
//    enum Gender {
//        case male, female
//    }
//
//    var name: String
//    var gender: Gender
//    var age: Int
//
//    init(name: String, gender: Gender, age: Int) {
//        self.name = name
//        self.gender = gender
//        self.age = age
//    }
//}

struct Staff {
    enum Gender {
        case male, female
    }
    
    var name: String
    var gender: Gender
    var age: Int
}

let staff = [Staff(name: "Nick", gender: .male, age: 37),
             Staff(name: "Julia", gender: .female, age: 29),
             Staff(name: "Tom", gender: .male, age: 41),
             Staff(name: "Tony", gender: .male, age: 45),
             Staff(name: "Emily", gender: .female, age: 42),
             Staff(name: "Irene", gender: .female, age: 30)]


let hasSaffOver40 = staff.contains { $0.age > 40 }
print("hasSaffOver40", hasSaffOver40)

let hasMalesOver50 = staff.contains { $0.age > 50 && $0.gender == .male }
print("hasMalesOver50", hasMalesOver50)

let hasFemalesUnder30 = staff.contains { $0.age < 30 && $0.gender == .female }
print("hasFemalesUnder30", hasFemalesUnder30)
