import Foundation

//var someNumber = 7
//
//func incrementByTen(_ number: inout Int) {
//    number += 10
//}
//
//incrementByTen(&someNumber)
//print(someNumber) // 7

//var someNumber = 7
//
//func incrementByTen(_ number: inout Int) {
//  print(someNumber)   // error: simultaneous access
//  number += 10
//}
//
//incrementByTen(&someNumber) // error: Execution was interrupted, reason: signal SIGABRT.
//print(someNumber)

// ----------

//var stepSize = 1
//
//func increment(_ number: inout Int) {
//    number += stepSize
//}
//
//increment(&stepSize)    // error: Execution was interrupted, reason: signal SIGABRT.


var stepSize = 1

// Make an explicit copy.
var copyOfStepSize = stepSize

func increment(_ number: inout Int) {
    number += stepSize
}

increment(&copyOfStepSize)

// Update the original.
stepSize = copyOfStepSize

print(stepSize) // 2

// ----------

func balance(_ x: Int, _ y: Int) -> (Int, Int) {
    let sum = x + y
    return (sum / 2, sum - x)
}

var playerOneScore = 42
var playerTwoScore = 30
let (lhs1, rhs1): (Int, Int) = balance(playerOneScore, playerTwoScore)
let (lhs2, rhs2): (Int, Int) = balance(playerOneScore, playerOneScore)

print(lhs1, rhs1) // 36 30
print(lhs2, rhs2) // 42 42

//func balance(_ x: inout Int, _ y: inout Int) {
//    let sum = x + y
//    x = sum / 2
//    y = sum - x
//}
//var playerOneScore = 42
//var playerTwoScore = 30
//balance(&playerOneScore, &playerTwoScore) // OK
//balance(&playerOneScore, &playerOneScore) // error: conflicting accesses to playerOneScore
