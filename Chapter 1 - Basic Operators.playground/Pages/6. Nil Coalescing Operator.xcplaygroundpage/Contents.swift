import Foundation

// 6. Nil Coalescing Operator (Nil 병합 연산자)
print("The nil-coalescing operator(a ?? b) is shorthand for the code (a != nil ? a! : b).\n")
// a! means forced unwrapping
let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil

var colorNameToUse = userDefinedColorName ?? defaultColorName
print("userDefinedColorName: \(userDefinedColorName as Any)")
print("colorNameToUse = userDefinedColorName ?? defaultColorName    >> colorNameToUse is \(colorNameToUse)\n")

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
print("userDefinedColorName: \(userDefinedColorName as Any)")
print("colorNameToUse = userDefinedColorName ?? defaultColorName    >> colorNameToUse is \(colorNameToUse)\n")
