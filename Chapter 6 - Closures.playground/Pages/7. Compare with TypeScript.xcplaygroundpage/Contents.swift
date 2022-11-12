import Foundation

// 1. Function Declarations with `function` / `func` keyword
func sum(_ a: Int, _ b: Int) -> Int {
    a + b
}
print(sum(5, 7))    // 12


print("----------------------------------------------")
// 2. Function Expressions with `Lambda expressions` / `Closures`
//let product = { (a: Int, b: Int) in
//    a * b
//}
let product: (Int, Int) -> Int = { $0 * $1 }
print(product(5, 7))    // 35


print("----------------------------------------------")
// 3. Closures
let greetingMessage = { "Hello~ Siwft" }
print(greetingMessage())    // Hello~ Swift


print("----------------------------------------------")
// 4. Autoclosures
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}

// `{ }` can be omitted
serve(customer: customersInLine.remove(at: 0))      // Now serving Chris!


print("----------------------------------------------")
// 5. Capturing Values with `Closures`
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let increaseByThree = makeIncrementer(forIncrement: 3)

print(increaseByThree())    // 3
print(increaseByThree())    // 6
print(increaseByThree())    // 9
