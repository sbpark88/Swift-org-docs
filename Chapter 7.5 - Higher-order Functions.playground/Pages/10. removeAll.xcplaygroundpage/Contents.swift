import Foundation


// 1. Compare removeAll and filter
var scores: [Int] = [100, 75, 80, 66, 93, 52, 96, 87, 72]

// filter
let graterThanOrEqualNinety: [Int] = scores.filter { $0 >= 90 }
print(graterThanOrEqualNinety)  // [100, 93, 96]

// removeAll
//scores.removeAll { $0 >= 90 }
//print(scores)   // [75, 80, 66, 52, 87, 72]

//let lowerThanNinety = scores.removeAll { $0 >= 90 }
//print(lowerThanNinety)  // ()

// removeAll
scores.removeAll { $0 < 90 }
print(scores)   // [100, 93, 96]


print("-----------------------------------------")
// 2. Compare removeAll and filter & contains(_:)
var words: [String] = ["room", "home", "train", "green", "heroe"]

// filter
//let wordsWithO: [String] = words.filter { $0.contains("o") }
//print(wordsWithO)   // ["room", "home", "heroe"]

// removeAll
words.removeAll { $0.contains("o") }
print(words)        // ["train", "green"]


print("-----------------------------------------")
// 3. Compare removeAll and filter & contains(where:)

words = ["room", "home", "train", "green", "heroe"]

// filter
let wordsWithO = words.filter { $0.contains("o") && $0.count >= 5 }
print(wordsWithO)   // ["heroe"]


// removeAll
words.removeAll { $0.contains("o") && $0.count >= 5 }
print(words)        // ["room", "home", "train", "green"]
