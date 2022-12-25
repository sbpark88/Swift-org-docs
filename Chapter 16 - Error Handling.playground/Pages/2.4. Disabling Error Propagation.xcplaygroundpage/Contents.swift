import Foundation

enum SomeError: Error {
case zero
}

func someThrowingFunction(_ input: Int) throws -> Int {
    if input == 0 {
        throw SomeError.zero
    } else {
        return input
    }
}

let q = try someThrowingFunction(1)
print(q as Any)                         // 1

print("----------------------------------------")
func someThrowingFunctionWithOptional(_ input: Int) throws -> Int? {
    if input == 0 {
        throw SomeError.zero
    } else {
        return input
    }
}

let x = try someThrowingFunction(1)
print(x as Any)                         // 1
let y = try! someThrowingFunction(1)
print(y as Any)                         // 1
