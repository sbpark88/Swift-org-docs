import Foundation

// 9. Substrings (부분 문자열)
/*
 Substrings in Swift have most of the same methods as strings,
 which means you can work with substrings the same way you work with strings.
 */

let greeting = "Hello, world!"
print("greeting: \(greeting)")
print("type of greeting is \(type(of: greeting))\n")

let index = greeting.firstIndex(of: ",") ?? greeting.endIndex
let beginning = greeting[..<index]
print("beginning: \(beginning)")
print("type of beginning is \(type(of: beginning))\n")

print("--------------------------------------------------------")
var fullName = "Michale Jackson"
let separatorIndex = fullName.firstIndex(of: " ")
let afterSeparatorIndex = fullName.index(after: separatorIndex!)
var firstName = fullName[..<separatorIndex!]
var lastName = fullName[afterSeparatorIndex...]

print("\nFull name: \(fullName), type: \(type(of: fullName)), address: \(address(of: &fullName))")
//print("First name: \(firstName), type: \(type(of: firstName))") // error: Execution was interrupted, reason: EXC_BAD_ACCESS
//print("Last name: \(lastName),  type: \(type(of: lastName))")   // Cannot convert value of type 'String.SjubSequence' (aka 'Substring') to expected argument type 'UnsafeRawPointer'

fullName = "Michale Jordan"

print("\nFull name: \(fullName), type: \(type(of: fullName)), address: \(address(of: &fullName))")
print("First name: \(firstName), type: \(type(of: firstName))") // Cannot convert value of type 'String.SubSequence' (aka 'Substring') to expected argument type 'UnsafeRawPointer'
print("Last name: \(lastName),  type: \(type(of: lastName))")   // Cannot convert value of type 'String.SubSequence' (aka 'Substring') to expected argument type 'UnsafeRawPointer'


/*
 Summary
 
 1. Both 'String' and 'Substring' confirm to the 'StringProtocol' protocol, thus, we can call functions similly.
 2. The 'String' has a region of memory for own values.
 3. While, the 'Substring' does not have a region of memory, reuse the storage of the original string.
 Thus, it is not suitable for long life-cycle.
 4. In the above case, 'beginning' is a substring of 'greeting'.
 
 */





func address(of object: UnsafeRawPointer) -> String {
    let address = Int(bitPattern: object)
    return String(format: "%p", address)
}
