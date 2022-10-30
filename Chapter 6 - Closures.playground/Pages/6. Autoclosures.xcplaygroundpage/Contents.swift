import Foundation

// 1. Delay evaluation
//var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//
//let customerProvider = { customersInLine.remove(at: 0) }
//print(customersInLine)          // ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//print(customersInLine.count)    // 5
//
//customerProvider()
//print(customersInLine)          // ["Alex", "Ewa", "Barry", "Daniella"]
//print(customersInLine.count)    // 4
//
//customerProvider()
//print(customersInLine)          // ["Ewa", "Barry", "Daniella"]
//print(customersInLine.count)    // 3


// 2.1 Parameter Type is a Closure
//var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//
//func serve(customer customerProvider: () -> String) {
//    print("Now serving \(customerProvider())!")
//}
//
//serve(customer: { customersInLine.remove(at: 0) })  // Now serving Chris!


// 2.2 Parameter Type is an Autoclosure
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}

// `{ }` can be omitted
serve(customer: customersInLine.remove(at: 0))      // Now serving Chris!


// 2.3 Parameter Type is a String
//var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//
//func serve(customer customerProvider: String) {
//    print("Now serving \(customerProvider)!")
//}
//
//serve(customer: customersInLine.remove(at: 0))      // Now serving Chris!


print("-------------------------------------------")
// 3. Autoclosures with Escaping Closures
customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProviders(customersInLine.remove(at: 0))
collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures.")

print("customerProviders: \(customerProviders)")

for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}

//Collected 2 closures.
//[(Function), (Function)]
//Now serving Chris!
//Now serving Alex!


print("-------------------------------------------")
// 4. Compare with TypeScript

// Function Declarations
func greetingMessage() -> String {
    return "Hello~ Swift"
}
print(greetingMessage())            // Hello~ Swift

// Function Expressions with closures
let anotherGreetingMessage = { () -> String in
    return "Hello~ Swift"
}
print(anotherGreetingMessage())     // Hello~ Swift

// Autoclosures
let theOtherGreetingMessage = { "Hello~ Siwft" }
print(theOtherGreetingMessage())    // Hello~ Swift
