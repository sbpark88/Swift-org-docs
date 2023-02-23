import Foundation

let words: [String] = ["room", "home", "train", "green", "heroe"]

// 1. allSatisfy(_:)

// 1.1 For-In Loops
//let isAllTrue: Bool = {
//    var isAllTrue = true
//    for word in words {
//        if word.count < 4 {
//            isAllTrue = false
//            break
//        }
//    }
//    return isAllTrue
//}()
//
//print(isAllTrue)   // true


// 1.2 AND Operator(&&)
//let isAllTrue: Bool = words[0].count >= 4 &&
//                      words[1].count >= 4 &&
//                      words[2].count >= 4 &&
//                      words[3].count >= 4 &&
//                      words[4].count >= 4
//
//print(isAllTrue)   // true


// 1.3 Switch
//let isAllTrue: Bool = {
//    switch true {
//    case words[0].count < 4: return false
//    case words[1].count < 4: return false
//    case words[2].count < 4: return false
//    case words[3].count < 4: return false
//    case words[4].count < 4: return false
//    default: return true
//    }
//}()
//
//print(isAllTrue)   // true


// 1.4 allSatisfy
let isAllTrue: Bool = words.allSatisfy { $0.count >= 4 }
print(isAllTrue)   // true


// 1.5 filter
//let isAllTrue: Bool = words.filter { $0.count < 4 }.count > 0 ? false : true
//print(isAllTrue)   // true
