import Foundation

// 1. Using Function Types

//func addTwoInts(_ a: Int, _ b: Int) -> Int {
//    a + b
//}
//func multiplyTwoInts(_ a: Int, _ b: Int) -> Int {
//    return a * b
//}
//
//var mathFunction: (Int, Int) -> Int = addTwoInts(_:_:)
//print(mathFunction(5, 7))   // 12
//
//mathFunction = multiplyTwoInts(_:_:)
//print(mathFunction(5, 7))   // 35


//let addTwoInts: (Int, Int) -> Int = { (_ a: Int, _ b: Int) in
//    a + b
//}
//
//let multiplyTwoInts = { (_ a: Int, _ b: Int) in
//    a * b
//}
//
//print(addTwoInts(5, 7))         // 12
//print(multiplyTwoInts(5, 7))    // 35


// With typealias
typealias arithmeticCalc = (Int, Int) -> Int

let addTwoInts: arithmeticCalc = { $0 + $1 }
let multiplyTwoInts: arithmeticCalc = { $0 * $1 }


print(addTwoInts(5, 7))         // 12
print(multiplyTwoInts(5, 7))    // 35


print("---------------------------------------")
// 2. Function Types as Parameter Types

func printMathResult(mathFunction function: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(function(a, b))")
}

printMathResult(mathFunction: addTwoInts, 5, 7)       // Result: 12
printMathResult(mathFunction: multiplyTwoInts, 5, 7)  // Result: 35


print("---------------------------------------")
// 3. Function Types are Return Types

func stepForward(_ input: Int) -> Int {
    print(#function)
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    print(#function)
    return input - 1
}

func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    backward ? stepBackward(_:) : stepForward(_:)
}


func movingStart(initialValue: Int) {
    var currentValue = initialValue
    let moveNearToZero = chooseStepFunction(backward: currentValue > 0)

    print("Conting to zero:")
    while currentValue != 0 {
        print("\(currentValue)... Call ", terminator: "")
        currentValue = moveNearToZero(currentValue)
    }
    print("zero!\n")
}

movingStart(initialValue: 4)
movingStart(initialValue: -3)


