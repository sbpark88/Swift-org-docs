import Foundation

enum SomeError: Error {
case zero
}

func someOptionalFunction(_ input: Int) -> Int? {
    if input == 0 {
        return nil
    } else {
        return input
    }
}

let x: Int? = someOptionalFunction(0)
print(x as Any)                         // nil
let y: Int? = someOptionalFunction(1)
print(y as Any)                         // Optional(1)


print("---------------------------------------------")
func someThrowingFunction(_ input: Int) throws -> Int {
    if input == 0 {
        throw SomeError.zero
    } else {
        return input
    }
}

let p = try? someThrowingFunction(0)
print(p as Any)                         // nil
let q = try? someThrowingFunction(1)
print(q as Any)                         // Optional(1)


print("---------------------------------------------")
let v: Int?
do {
    v = try someThrowingFunction(0)
} catch is SomeError {
    v = nil
}
print(v as Any)                         // nil

let w: Int?
do {
    w = try someThrowingFunction(1)
} catch is SomeError {
    w = nil
}
print(w as Any)                         // Optional(1)
