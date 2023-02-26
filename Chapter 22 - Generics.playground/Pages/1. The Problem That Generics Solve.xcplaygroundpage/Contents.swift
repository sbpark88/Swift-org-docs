import Foundation

func swap(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someInt = 3
var anotherInt = 107
swap(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")

func swap(_ a: inout Double, _ b: inout Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swap(_ a: inout String, _ b: inout String) {
    let temporaryA = a
    a = b
    b = temporaryA
}

var someDouble = 6.2
var anotherDouble = 20.2
swap(&someDouble, &anotherDouble)
print("someDouble is now \(someDouble), and anotherDouble is now \(anotherDouble)")

var someString = "Apple"
var anotherString = "Pear"
swap(&someString, &anotherString)
print("someString is now '\(someString)', and anotherString is now '\(anotherString)'")
