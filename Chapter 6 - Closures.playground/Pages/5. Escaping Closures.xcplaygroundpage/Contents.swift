import Foundation

// 1. Store in a variable

var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}


//func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
//    completionHandlers.append(completionHandler)
//}

//var completionHandlers: [() -> Void] = []
//func someFunctionWithEscapingClosure(completionHandler: () -> Void) {
//    completionHandlers.append(completionHandler)    // error: converting non-escaping parameter 'completionHandler' to generic parameter 'Element' may allow it to escape
//}


func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}


//class SomeClass {
//    var x = 10
//    func doSomething() {
//        someFunctionWithEscapingClosure {
//            self.x = 100
//        }
//        someFunctionWithNonescapingClosure {
//            x = 200
//        }
//    }
//}

class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { [self] in
            x = 100
        }
        someFunctionWithNonescapingClosure {
            x = 200
        }
    }
}


let instance = SomeClass()
instance.doSomething()      // `someFunctionWithNonescapingClosure` is called in `doSomething` function's body

print(instance.x)   // 200

completionHandlers.first?() // `someFunctionWithEscapingClosure ` is not called in `doSomething()` function's body
print(instance.x)   // 100


print("--------------------------------------------")
// 2. Escaping Closures in Structures

//struct SomeStruct {
//    var x = 10
//    mutating func doSomething() {
//        someFunctionWithNonescapingClosure { x = 200 }  // Ok
//        someFunctionWithEscapingClosure { x = 100 }     // error: escaping closure captures mutating 'self' parameter
//    }
//}

struct SomeStruct {
    var x = 10
    mutating func doSomething() {
        someFunctionWithNonescapingClosure { x = 200 }
    }
    func anotherDoSomething() {
        someFunctionWithEscapingClosure { print("It's OK") }
    }
}

var valueTypeInstance = SomeStruct()    // It must be declared with `var` not `let`, due to `doSomething()` use mutating member.

valueTypeInstance.doSomething()
print(valueTypeInstance.x)  // 200

valueTypeInstance.anotherDoSomething()
completionHandlers[1]()     // It's OK
