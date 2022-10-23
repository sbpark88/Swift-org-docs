import Foundation

// 1. Default Parameter Values

//func add(a num1: Int, b num2: Int = 10) -> Int {
//    num1 + num2
//}
//
//print(add(a: 5, b: 20))     // 25
//print(add(a: 5))            // 15
//
//print(add(a: 5, b: nil))    // 'nil' is not compatible with expected argument type 'Int'


//func add(a num1: Int) -> Int {
//    num1 + 100
//}
//
//func add(a num1: Int, b num2: Int = 10) -> Int {
//    num1 + num2
//}
//
//print(add(a: 5, b: 20))     // 25
//print(add(a: 5))            // 105


//func add(a num1: Int, b num2: Int? = 10) -> Int {
//    if let num2 = num2 {
//        return num1 + num2
//    } else {
//        return num1 + 10
//    }
//}

func add(a num1: Int, b num2: Int? = 10) -> Int {
    guard let num2 = num2 else { return num1 + 10 }
    return num1 + num2
}

print(add(a: 5, b: 20))     // 25
print(add(a: 5))            // 15

print(add(a: 5, b: nil))    // 15

print("------------------------------------------------")

// 2. Variadic Parameters
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

print(arithmeticMean(2))                // 2.0
print(arithmeticMean(1, 2, 3, 4, 5))    // 3.0
print(arithmeticMean(3, 8.25, 18.75))   // 10.0


func arithmeticMean(_ numbers: [Double]) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}

print(arithmeticMean([2]))              // 2.0
print(arithmeticMean([1, 2, 3, 4, 5]))  // 3.0
print(arithmeticMean([3, 8.25, 18.75])) // 10.0


// 3. In-Out Parameters
print("------------------------------------------------")
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
