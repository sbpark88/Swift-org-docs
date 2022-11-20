import Foundation

let marks = [[3, 4, 5], [2, 5, 3], [1, 2, 2], [5, 5, 4], [3, 5, 3]]

// 1. 2D Array > 1D Array
//var allMarks: [Int] = []
//for marksArray in marks {
//    allMarks += marksArray
//}

let allMarks = marks.flatMap { $0 }

print(allMarks) // [3, 4, 5, 2, 5, 3, 1, 2, 2, 5, 5, 4, 3, 5, 3]


print("-----------------------------------------")
// 2. another usage
//var sum: Int = 0
//for marksArray in marks {
//    for element in marksArray {
//        sum += element
//    }
//}

let sum = marks
    .flatMap { $0 }
    .reduce(0) { $0 + $1 }

print(sum)  // 52


print("-----------------------------------------")
// 3. Composite case
let marksWithNil = [[3, nil, 5], [2, 5, nil], [1, 2, 2], [5, 5, 4], [nil, 5, 3]]

//for marksArray in marksWithNil {
//    for element in marksArray {
//        anotherSum += element ?? 0
//    }
//}

//for marksArray in marksWithNil {
//    for element in marksArray {
//        guard let element = element else { continue }
//        anotherSum += element
//    }
//}

//var anotherSum: Int = 0
//for marksArray in marksWithNil {
//    for element in marksArray where element != nil {
//        anotherSum += element!
//    }
//}



//let anotherSum = marksWithNil
//    .flatMap { $0 }
//    .reduce(0) { $0 + ($1 ?? 0) }

//let anotherSum = marksWithNil.lazy
//    .flatMap { $0 }
//    .filter { $0 != nil }
//    .reduce(0) { $0 + $1! }

let anotherSum = marksWithNil.lazy
    .flatMap { $0 }
    .compactMap { $0 != nil ? $0 : nil }
    .reduce(0) { $0 + $1 }

print(anotherSum)   // 42
