import Foundation

// 1. Function Declarations
func twice(_ f: @escaping (Int) -> Int) -> (Int) -> Int {
    { f(f($0)) }
}

//typealias intToInt = (Int) -> Int
//
//func twice(_ f: @escaping intToInt) -> intToInt {
//    { f(f($0)) }
//}

func plusThree(_ i: Int) -> Int {
    i + 3
}

let someFunction = twice(plusThree(_:))

print(someFunction(7))  // 13   (7 + 3) + 3
print(someFunction(9))  // 15   (9 + 3) + 3
print(someFunction(12)) // 18   (12 + 3) + 3


print("---------------------------------------")
// 2. Function Expressions
//let twice2 = { (f: @escaping (Int) -> Int) in
//    { f(f($0)) }
//}

//let twice2 = { (f: @escaping intToInt) in
//    { f(f($0)) }
//}


let twice2: (@escaping (Int) -> Int) -> (Int) -> Int = { f in
    { f(f($0)) }
}

//let twice2: (@escaping intToInt) -> intToInt = { f in
//    { f(f($0)) }
//}

let plusThree2: (Int) -> Int = { $0 + 3 }

let someFunction2 = twice2(plusThree2)

print(someFunction2(7))  // 13   (7 + 3) + 3
print(someFunction2(9))  // 15   (9 + 3) + 3
print(someFunction2(12)) // 18   (12 + 3) + 3
