import Foundation

// 2. Arrays (배열) Part 1 - Creation
/*
 An ordered, random-access collection.
 Swift’s Array type is bridged to Foundation’s NSArray class.
 */


// 1. Array Type Syntax
// var someArray = Array<Element>()
// var someArray: [Element] = []   // Array Type Shorthand Syntax (배열의 축약형 문법)

// 2. Creating an Empty Array (빈 배열 생성)
// var someArray = Array<Int>()
var someArray: [Int] = []

someArray.append(5)
someArray.append(9)

print(someArray)   // [5, 9]

someArray = []
print(someArray)   // []
/*
 someArray is now an empty array, but is still of type [Int]
 */


// 3. Creating an Array with a Default Value (기본 값으로 빈 배열 생성)
var threeDoubles = Array(repeating: 0.0, count: 3)
print(threeDoubles)


// 4. Creating an Array by Adding Two Arrays Together (다른 배열을 추가한 배열의 생성)
/*
 Between two existing 'Arrays' can be added with the addition operator(+), then a new 'Array' is created.
 */
var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
var sixDoubles = threeDoubles + anotherThreeDoubles
print(sixDoubles)


// 5. Creating an Array with an Array Literal (리터럴을 이용한 배열의 생성)
// var shoppingList: [String] = ["Eggs", "Milk"]
// print(shoppingList)

// If the array literal contains values are only one type, `Swift` infer the type of the array.추론한다.
// var shoppingList = ["Eggs", "Milk"]
// print(shoppingList)


// In this case, `Swift` cannot infer the type, because of the array literal has more than one type.
// var anyArray = ["Eggs", 5]  // error occured, add explicit type [Any] annotation
// print(anyArray)

// The array can store two or more types, however, in this case cannot use type inference.
var anyArray: [Any] = ["Eggs", 5]
print(anyArray)
