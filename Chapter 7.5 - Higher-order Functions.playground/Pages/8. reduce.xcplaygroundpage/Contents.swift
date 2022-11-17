import Foundation

let numbers: [Int] = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]


//- For-In Loops
//let sum: Int = {
//    var sum: Int = 0        // initialValue is '0'
//    for number in numbers {
//        sum += number
//    }
//    return sum
//}()
//
//let product: Int = {
//    var product: Int = 1    // initialValue is '1'
//    for number in numbers {
//        product *= number
//    }
//    return product
//}()
//
//print("sum: \(sum)   product: \(product)")  // sum: 55   product: 3628800



// - reduce

//let sum: Int = numbers.reduce(0, { (prev, curr) -> Int in prev + curr })    // initialValue is '0'
//let product: Int = numbers.reduce(1, {(prev, curr) -> Int in prev * curr }) // initialValue is '1'

let sum: Int = numbers.reduce(0, { $0 + $1 })
let product: Int = numbers.reduce(1) { $0 * $1 }

print("sum: \(sum)   product: \(product)")  // sum: 55   product: 3628800


