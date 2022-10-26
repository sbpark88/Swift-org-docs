import Foundation

// 1. Closure Expressions

func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}

// Here's how you call this function without using a trailing closure:

someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})

// Here's how you call this function with a trailing closure instead:

someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}

someFunctionThatTakesAClosure {
    // trailing closure's body goes here
}


print("-----------------------------------------")
// 2. Trailing Closure Examples

let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
let descendingNames = names.sorted { $0 > $1 }

print(descendingNames)  // ["Ewa", "Daniella", "Chris", "Barry", "Alex"]


// Without Trailing Closures
names.sorted(by: { $0 > $1 } )

// Using Operator Methods
names.sorted(by: >)


// With Trailing Closures
names.sorted { $0 > $1 }

// Using Operator Methods with Trailing Closures
//print(names.sorted { > })   // error: unary operator cannot be separated from its operand


print("-----------------------------------------")
/*
 `map(_:)`메서드를 이용해 아래 주어진 `digitNames`, `numbers` 배열로부터
 `["OneSix", "FiveEight", "FiveOneZero"]` 새 배열을 반환하도록 `Trailing Closures`를 만들어본다.
 */

let digitNames = [
    0: "Zero", 1: "One", 2: "Two",   3: "Three", 4: "Four",
    5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
]
let numbers = [16, 58, 510]


let strings = numbers.map { number -> String in
    var number = number
    var output = ""
    
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    
    return output
}

print(strings)  // ["OneSix", "FiveEight", "FiveOneZero"]


let anotherStrings = numbers.map { number in
    var number = number
    var output = ""
    
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    
    return output
}

print(anotherStrings)

let anotherStrings2 = numbers.map {
    var number = $0
    var output = ""
    
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    
    return output
}

print(anotherStrings2)

// 3. A function takes `Multiple Closures`

//func loadPicture(from server: Server, completion: (Picture) -> Void, onFailure: () -> Void) {
//    if let picture = download("photo.jpg", from: server) {
//        completion(picture)
//    } else {
//        onFailure()
//    }
//}
