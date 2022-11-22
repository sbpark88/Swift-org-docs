import Foundation

struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let hd = Resolution(width: 1920, height: 1080)


// 1. Classes
// 1.1. Declare a new constant and sets it to refer to a new instance of the `VideoMode` class.
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

// 1.2. Next, `tenEighty` is assigned to a new constant, called `alsoTenEighty`.
let alsoTenEighty = tenEighty

// 1.3. And the frame rate of `alsoTenEighty` is modified.
alsoTenEighty.frameRate = 30.0

print("The frameRate property of alsoTenEighty is now \(alsoTenEighty.frameRate)")
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")


print(tenEighty)        // __lldb_expr_11.VideoMode
print(alsoTenEighty)    // __lldb_expr_11.VideoMode


print("---------------------------------------")
// 2. Identity Operators

// Equal to(==)
print(5 == 5)       // true
print(5 == 7)       // false

// Not equal to(!=)
print(5 != 7)       // true


// Equal to(===)
//let numA = 5
//let numB = numA
//print(numA === numB)  // error: argument type 'Int' is not a reference types

print(tenEighty === alsoTenEighty)  // true
print(tenEighty !== alsoTenEighty)  // false

if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
// Prints "tenEighty and alsoTenEighty refer to the same VideoMode instance."
