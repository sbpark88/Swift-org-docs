import Foundation

infix operator |>: AdditionPrecedence

func |> <T, R>(value: T, function: (T) -> R) -> R {
    return function(value)
}


func add(_ lhs: Int, _ rhs: Int) -> Int {
    lhs + rhs
}
let multiply = { (lhs: Int, rhs: Int) in lhs * rhs }
let subtract = { (lhs: Int, rhs: Int) in lhs - rhs }

func add5(_ x: Int) -> Int {
    add(x, 5)
}
let multiply4 = { (x: Int) in multiply(x, 4) }
let subtract6 = { (x: Int) in subtract(x, 6) }
let toString = { (x: Int) in String(x) }


//func functionComposition(_ initValue: Int) -> String {
//    initValue
//    |> add5
//    |> multiply4
//    |> subtract6
//    |> toString
//}

let functionComposition = {
    $0
    |> add5
    |> multiply4
    |> subtract6
    |> toString
}

print(functionComposition(7))   // "42"

let someArray: [Int] = [1, 5, 7, 13, 23, 37]
let newArray: [String] = someArray.map(functionComposition)
print(newArray)     // ["1", "5", "7", "13", "23", "37"]
